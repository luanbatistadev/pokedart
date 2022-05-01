import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedart/models/pokemon.dart';
import 'package:pokedart/services/pokemon_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'pokemon_stores.g.dart';

class PokemonApiStore = _PokeApiStoreBase with _$PokemonApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  List<Pokemon> pokemons = [];

  @observable
  Pokemon pokemon = Pokemon();

  @observable
  bool isFavorite = false;

  @observable
  List<String> historyList = [];

  @action
  Future<void> getHistoryList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    historyList = prefs.getStringList('history') ?? [];
  }

  @action
  Future<void> setHistory(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    historyList = prefs.getStringList('history') ?? [];
    if (!historyList.contains(name)) {
      historyList = [name, ...historyList];
      prefs.setStringList('history', historyList);
    }
  }

  @action
  Future<void> getFavoriteList() async {
    final prefs = await SharedPreferences.getInstance();
    final favorite = prefs.getStringList('pokemons');
    final List<Pokemon> pokemons = [];
    if (favorite != null) {
      for (final element in favorite) {
        final pokemon = Pokemon(name: element);
        pokemons.add(pokemon);
      }
      this.pokemons = pokemons;
    }
  }

  @action
  Future<void> getFavorite(String name) async {
    final prefs = await SharedPreferences.getInstance();
    final favorite = prefs.getStringList('pokemons');
    if (favorite != null) {
      for (final element in favorite) {
        if (element == name) {
          isFavorite = true;
        }
      }
    }
  }

  @action
  Future<void> changeFavorite(Pokemon pokemon) async {
    isFavorite = !isFavorite;

    if (Platform.isAndroid || Platform.isIOS) {
      Fluttertoast.showToast(
        msg: isFavorite
            ? "Pokemon Favoritado!"
            : "Pokemon Removido dos Favoritos!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }

    final prefs = await SharedPreferences.getInstance();
    List<String>? pokemons = prefs.getStringList('pokemons') ?? [];
    if (isFavorite) {
      pokemons = [pokemon.name!, ...pokemons];
    } else {
      pokemons.remove(pokemon.name);
    }
    await prefs.setStringList('pokemons', pokemons);
  }

  @action
  Future<void>  fetchPokemons() async {
    final List<Pokemon> pokemons = await fetchPokemonsFromApi();

    this.pokemons = pokemons;
  }

  @action
  Future<void> searchPokemon(String name) async {
    await fetchPokemons();
    final List<Pokemon> pokemons = this
        .pokemons
        .where(
          (e) => hasWildcardMatch(
            e.name!.toLowerCase(),
            name.toLowerCase(),
          ),
        )
        .toList();

    this.pokemons = pokemons;
  }

  @action
  Future<void> fetchDataListPokemon() async {
    final List<Pokemon> pokemons = this.pokemons;
    for (var i = 0; i < pokemons.length; i++) {
      final Pokemon pokemon = await fetchDataPokemon(pokemons[i].name!) ;

      pokemons[i] = pokemon;
      this.pokemons = pokemons;
    }
  }

  @action
  Future<void> fetchPokemon(String name) async {
    final pokemon = await fetchDataPokemon(name);
    this.pokemon = pokemon;
  }

  bool hasWildcardMatch(String source, String text) {
    final regexp = text.split('').join('.*');

    return RegExp(regexp).hasMatch(source);
  }
}
