import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedart/screens/favorite_page/components/pokemon_tile.dart';
import 'package:pokedart/stores/pokemon_stores.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, required this.pokemonName}) : super(key: key);

  final String pokemonName;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final PokemonApiStore _pokemonApiStore = PokemonApiStore();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    await _pokemonApiStore.searchPokemon(widget.pokemonName);
    await _pokemonApiStore.fetchDataListPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      title: const Text(
        'Resultado da Pesquisa',
        style: TextStyle(
            color: Color.fromARGB(255, 2, 0, 91),
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Color.fromARGB(255, 2, 0, 91),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      floating: true,
      snap: true,
      backgroundColor: Colors.white,
      bottom: PreferredSize(
        preferredSize: const Size(40, 25),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 73, bottom: 15),
              child: Text(
                widget.pokemonName,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w300,),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Observer(
      builder: (context) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return PokemonTile(
              pokemon: _pokemonApiStore.pokemons[index],
            );
          },
          childCount: _pokemonApiStore.pokemons.length,
        ),
      ),
    );
  }
}
