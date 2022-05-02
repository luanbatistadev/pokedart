import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedart/components/constants/constants.dart';
import 'package:pokedart/components/extension_string.dart';
import 'package:pokedart/components/place_holder.dart';
import 'package:pokedart/models/pokemon.dart';
import 'package:pokedart/screens/pokemon_page/pokemon_header.dart';
import 'package:pokedart/stores/pokemon_stores.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  final PokemonApiStore _pokemonApiStore = PokemonApiStore();
  @override
  void initState() {
    super.initState();
    _pokemonApiStore.fetchPokemon(widget.pokemon.name!);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: PokemonHeader(
                  _pokemonApiStore.pokemon.name == null
                      ? widget.pokemon
                      : _pokemonApiStore.pokemon,
                  maxExtent: MediaQuery.of(context).size.height /
                      (Platform.isAndroid ? 4 : 3.2),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitle(),
                      _buildWeightPokemon(),
                      _buildEvolutions(),
                      _buildStatusBase(),
                      _buildHabilities(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeightPokemon() {
    final weight = _pokemonApiStore.pokemon.weight;
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Peso',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
              color: kBlueColor,
              fontSize: 16,
            ),
          ),
          PlaceholderContainer(
            child: weight == null
                ? null
                : Text(
                    '${weight / 10} kg',
                    style: const TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      color: kRedColor,
                      fontSize: 20,
                    ),
                  ),
          )
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Text(
            'Características',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: kFontSize,
              color: kBlueColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEvolutions() {
    final evolutions = _pokemonApiStore.pokemon.evolution?.chain;
    return Padding(
      padding: kPadding.copyWith(left: 0, bottom: 20, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Evoluções',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: kBlueColor,
            ),
          ),
          if (_pokemonApiStore.pokemon.evolution != null) ...[
            if (evolutions!.species?.name != null) ...[
              _buildElutionsText(evolutions.species?.name),
              if (evolutions.evolvesTo!.isNotEmpty) ...[
                if (evolutions.evolvesTo!.length > 1) ...[
                  for (var evolution in evolutions.evolvesTo!) ...[
                    _buildElutionsText(evolution.species?.name)
                  ]
                ] else ...[
                  _buildElutionsText(evolutions.evolvesTo!.first.species?.name),
                ],
                if (evolutions.evolvesTo!.first.evolvesTo!.isNotEmpty)
                  if (evolutions.evolvesTo!.first.evolvesTo!.length > 1) ...[
                    for (var evolution
                        in evolutions.evolvesTo!.first.evolvesTo!) ...[
                      _buildElutionsText(evolution.species?.name)
                    ]
                  ] else ...[
                    _buildElutionsText(
                      evolutions
                          .evolvesTo!.first.evolvesTo!.first.species?.name,
                    ),
                  ],
              ]
            ],
          ]
        ],
      ),
    );
  }

  Widget _buildElutionsText(String? evolution) {
    return Row(
      children: [
        PlaceholderContainer(
          size: const Size(35, 20),
          child: evolution == null
              ? null
              : InkWell(
                  onTap: () => widget.pokemon.name != evolution
                      ? Navigator.of(context).pushNamed(
                          '/pokemon',
                          arguments: Pokemon(name: evolution),
                        )
                      : null,
                  child: Text(
                    evolution.capitalize(),
                    style: const TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: kFontSize,
                      color: kRedColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
        ),
        const Text(
          ' (Raro)',
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 16,
            color: kRedColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildStatusBase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Status Base',
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: kBlueColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (_pokemonApiStore.pokemon.stats != null)
                    for (int i = 0; i < 3; i++)
                      _buildStatusText(
                        _pokemonApiStore.pokemon.stats![i],
                      ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (_pokemonApiStore.pokemon.stats != null)
                    for (int i = 3; i < 6; i++)
                      _buildStatusText(
                        _pokemonApiStore.pokemon.stats![i],
                      ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildStatusText(Stats stat) {
    return Expanded(
      child: Column(
        children: [
          PlaceholderContainer(
            size: const Size(35, 20),
            child: stat.baseStat == null
                ? null
                : Text(
                    stat.baseStat.toString(),
                    style: const TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      fontSize: kFontSize,
                      color: kRedColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
          ),
          PlaceholderContainer(
            size: const Size(35, 20),
            child: stat.stat!.name == null
                ? null
                : Text(
                    stat.stat!.name!.capitalize(),
                    style: const TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: kRedColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildHabilities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Habilidades',
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: kBlueColor,
          ),
        ),
        if (_pokemonApiStore.pokemon.abilities != null)
          for (final hability in _pokemonApiStore.pokemon.moves!)
            _buildHabilitiesText(hability.move!.name!),
      ],
    );
  }

  Widget _buildHabilitiesText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          const Icon(
            Icons.circle,
            color: kRedColor,
            size: 10,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            text.capitalize(),
            style: const TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: kRedColor,
            ),
          ),
        ],
      ),
    );
  }
}
