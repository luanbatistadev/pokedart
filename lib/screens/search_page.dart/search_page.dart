import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedart/components/constants/constants.dart';
import 'package:pokedart/models/pokemon.dart';
import 'package:pokedart/stores/pokemon_stores.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  final PokemonApiStore _pokemonApiStore = PokemonApiStore();
  @override
  void initState() {
    super.initState();
    _pokemonApiStore.getHistoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                _buildTextField(),
                _buildSuggestion(),
              ],
            ),
            _buildHistory(),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestion() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      child: Observer(
          builder: (context) => ListView.builder(
                itemBuilder: (context, index) => _buildSuggestionTile(index),
                itemCount: _pokemonApiStore.pokemons.length,
              ),),
    );
  }

  Widget _buildSuggestionTile(int index) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed('/pokemon', arguments: _pokemonApiStore.pokemons[index]);
        _pokemonApiStore.setHistory(_pokemonApiStore.pokemons[index].name!);
      },
      child: Observer(
        builder: (context) => Padding(
          padding: kPadding.copyWith(top: 10),
          child: Text(
            _pokemonApiStore.pokemons[index].name!,
            style: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize: kMinFontSize,
              color: kBlueColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return Padding(
      padding: kPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _searchController,
            onChanged: (value) async {
              await _pokemonApiStore.searchPokemon(value);
            },
            style: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize: kMinFontSize,
              color: kBlueColor,
              fontWeight: FontWeight.bold,
            ),
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              fillColor: const Color(0x00000000),
              filled: true,
              focusColor: const Color(0x00000000),
              hintText: 'Digite o nome do Pokémon',
              hintStyle: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: kMinFontSize,
                color: Colors.grey,
                fontWeight: FontWeight.w300,
              ),
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: kBlueColor,
                ),
                onPressed: () {
                  _searchController.clear();
                  _pokemonApiStore.searchPokemon(_searchController.text);
                },
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: const Text(
        'Pesquisar',
        style: TextStyle(
          color: kBlueColor,
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: kBlueColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildHistory() {
    return Column(
      children: [
        const Divider(thickness: 0.5, color: Colors.grey),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 20, bottom: 30, top: 10),
              child: Text(
                'Pesquisados recentemente',
                style: TextStyle(
                  fontSize: kMinFontSize,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: kBlueColor,
                ),
              ),
            ),
          ],
        ),
        Observer(
          builder: (context) => SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  if (index != 0)
                    const Divider(thickness: 0.5, color: Colors.grey),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/pokemon',
                        arguments: Pokemon(
                          name: _pokemonApiStore.historyList[index],
                        ),
                      );
                    },
                    child: ListTile(
                      trailing: const Icon(
                        Icons.history,
                        color: Colors.grey,
                      ),
                      title: Text(
                        _pokemonApiStore.historyList[index],
                        style: const TextStyle(
                          fontSize: kMinFontSize,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              itemCount: _pokemonApiStore.historyList.length,
            ),
          ),
        ),
      ],
    );
  }
}
