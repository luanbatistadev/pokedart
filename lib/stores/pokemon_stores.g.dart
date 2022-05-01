// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonApiStore on _PokeApiStoreBase, Store {
  final _$pokemonsAtom = Atom(name: '_PokeApiStoreBase.pokemons');

  @override
  List<Pokemon> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(List<Pokemon> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  final _$pokemonAtom = Atom(name: '_PokeApiStoreBase.pokemon');

  @override
  Pokemon get pokemon {
    _$pokemonAtom.reportRead();
    return super.pokemon;
  }

  @override
  set pokemon(Pokemon value) {
    _$pokemonAtom.reportWrite(value, super.pokemon, () {
      super.pokemon = value;
    });
  }

  final _$isFavoriteAtom = Atom(name: '_PokeApiStoreBase.isFavorite');

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  final _$historyListAtom = Atom(name: '_PokeApiStoreBase.historyList');

  @override
  List<String> get historyList {
    _$historyListAtom.reportRead();
    return super.historyList;
  }

  @override
  set historyList(List<String> value) {
    _$historyListAtom.reportWrite(value, super.historyList, () {
      super.historyList = value;
    });
  }

  final _$getHistoryListAsyncAction =
      AsyncAction('_PokeApiStoreBase.getHistoryList');

  @override
  Future getHistoryList() {
    return _$getHistoryListAsyncAction.run(() => super.getHistoryList());
  }

  final _$setHistoryAsyncAction = AsyncAction('_PokeApiStoreBase.setHistory');

  @override
  Future setHistory(String name) {
    return _$setHistoryAsyncAction.run(() => super.setHistory(name));
  }

  final _$getFavoriteListAsyncAction =
      AsyncAction('_PokeApiStoreBase.getFavoriteList');

  @override
  Future getFavoriteList() {
    return _$getFavoriteListAsyncAction.run(() => super.getFavoriteList());
  }

  final _$getFavoriteAsyncAction = AsyncAction('_PokeApiStoreBase.getFavorite');

  @override
  Future getFavorite(String name) {
    return _$getFavoriteAsyncAction.run(() => super.getFavorite(name));
  }

  final _$changeFavoriteAsyncAction =
      AsyncAction('_PokeApiStoreBase.changeFavorite');

  @override
  Future changeFavorite(Pokemon pokemon) {
    return _$changeFavoriteAsyncAction.run(() => super.changeFavorite(pokemon));
  }

  final _$fetchPokemonsAsyncAction =
      AsyncAction('_PokeApiStoreBase.fetchPokemons');

  @override
  Future fetchPokemons() {
    return _$fetchPokemonsAsyncAction.run(() => super.fetchPokemons());
  }

  final _$searchPokemonAsyncAction =
      AsyncAction('_PokeApiStoreBase.searchPokemon');

  @override
  Future searchPokemon(String name) {
    return _$searchPokemonAsyncAction.run(() => super.searchPokemon(name));
  }

  final _$fetchDataListPokemonAsyncAction =
      AsyncAction('_PokeApiStoreBase.fetchDataListPokemon');

  @override
  Future fetchDataListPokemon() {
    return _$fetchDataListPokemonAsyncAction
        .run(() => super.fetchDataListPokemon());
  }

  final _$fetchPokemonAsyncAction =
      AsyncAction('_PokeApiStoreBase.fetchPokemon');

  @override
  Future fetchPokemon(String name) {
    return _$fetchPokemonAsyncAction.run(() => super.fetchPokemon(name));
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons},
pokemon: ${pokemon},
isFavorite: ${isFavorite},
historyList: ${historyList}
    ''';
  }
}
