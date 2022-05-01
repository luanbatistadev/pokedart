import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedart/screens/favorite_page/components/pokemon_tile.dart';
import 'package:pokedart/stores/pokemon_stores.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final PokemonApiStore _pokemonApiStore = PokemonApiStore();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    await _pokemonApiStore.getFavoriteList();
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
    const _kAppBarColor = Color.fromARGB(255, 2, 0, 91);
    return SliverAppBar(
      title: const Text(
        'Favoritos',
        style: TextStyle(
          color: _kAppBarColor,
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: _kAppBarColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      floating: true,
      snap: true,
      backgroundColor: Colors.white,
    );
  }

  Widget _buildBody() {
    return Observer(
      builder: (context) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return PokemonTile(pokemon: _pokemonApiStore.pokemons[index]);
          },
          childCount: _pokemonApiStore.pokemons.length,
        ),
      ),
    );
  }
}
