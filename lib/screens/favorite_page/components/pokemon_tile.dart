import 'package:flutter/material.dart';
import 'package:pokedart/components/extension_string.dart';
import 'package:pokedart/components/place_holder.dart';
import 'package:pokedart/models/pokemon.dart';
import 'package:pokedart/stores/pokemon_stores.dart';

class PokemonTile extends StatefulWidget {
  const PokemonTile({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;

  @override
  State<PokemonTile> createState() => _PokemonTileState();
}

class _PokemonTileState extends State<PokemonTile> {
  Pokemon get _pokemon => widget.pokemon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/pokemon', arguments: _pokemon);
        PokemonApiStore().setHistory(_pokemon.name!);
      },
      child: Column(
        children: [
          const Divider(
            thickness: 0.5,
            height: 1.5,
          ),
          Container(
            color: Colors.white,
            height: 80,
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _buildCircleAvatar(),
                      _buildTitleSubtile(),
                    ],
                  ),
                ),
                _buildNextIcon(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleAvatar() {
    final String? image = _pokemon.sprites?.frontDefault;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 30,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 27,
              child: image != null
                  ? Image.network(
                      image,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    )
                  : const CircularProgressIndicator(
                      color: Colors.white,
                    ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitleSubtile() {
    final String? name = _pokemon.types?.first.type?.name;
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _pokemon.name!,
            style: const TextStyle(
              color: Color.fromARGB(255, 253, 26, 87),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          PlaceholderContainer(
            size: PlaceholderContainer.textPlaceholder,
            child: name != null
                ? Text(
                    'Tipo: ${name.capitalize()}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontFamily: 'OpenSans',
                      fontSize: 12,
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildNextIcon() {
    return const Icon(
      Icons.navigate_next_sharp,
      size: 50,
      color: Color.fromARGB(255, 253, 26, 87),
    );
  }
}
