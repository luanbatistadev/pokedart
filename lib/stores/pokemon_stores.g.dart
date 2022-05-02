// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonApiStore on _PokeApiStoreBase, Store {
  late final _$pokemonsAtom =
      Atom(name: '_PokeApiStoreBase.pokemons', context: context);

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

  late final _$pokemonAtom =
      Atom(name: '_PokeApiStoreBase.pokemon', context: context);

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

  late final _$isFavoriteAtom =
      Atom(name: '_PokeApiStoreBase.isFavorite', context: context);

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

  late final _$historyListAtom =
      Atom(name: '_PokeApiStoreBase.historyList', context: context);

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

  late final _$getHistoryListAsyncAction =
      AsyncAction('_PokeApiStoreBase.getHistoryList', context: context);

  @override
  Future<void> getHistoryList() {
    return _$getHistoryListAsyncAction.run(() => super.getHistoryList());
  }

  late final _$setHistoryAsyncAction =
      AsyncAction('_PokeApiStoreBase.setHistory', context: context);

  @override
  Future<void> setHistory(String name) {
    return _$setHistoryAsyncAction.run(() => super.setHistory(name));
  }

  late final _$getFavoriteListAsyncAction =
      AsyncAction('_PokeApiStoreBase.getFavoriteList', context: context);

  @override
  Future<void> getFavoriteList() {
    return _$getFavoriteListAsyncAction.run(() => super.getFavoriteList());
  }

  late final _$getFavoriteAsyncAction =
      AsyncAction('_PokeApiStoreBase.getFavorite', context: context);

  @override
  Future<void> getFavorite(String name) {
    return _$getFavoriteAsyncAction.run(() => super.getFavorite(name));
  }

  late final _$changeFavoriteAsyncAction =
      AsyncAction('_PokeApiStoreBase.changeFavorite', context: context);

  @override
  Future<void> changeFavorite(Pokemon pokemon) {
    return _$changeFavoriteAsyncAction.run(() => super.changeFavorite(pokemon));
  }

  late final _$fetchPokemonsAsyncAction =
      AsyncAction('_PokeApiStoreBase.fetchPokemons', context: context);

  @override
  Future<void> fetchPokemons() {
    return _$fetchPokemonsAsyncAction.run(() => super.fetchPokemons());
  }

  late final _$searchPokemonAsyncAction =
      AsyncAction('_PokeApiStoreBase.searchPokemon', context: context);

  @override
  Future<void> searchPokemon(String name) {
    return _$searchPokemonAsyncAction.run(() => super.searchPokemon(name));
  }

  late final _$fetchDataListPokemonAsyncAction =
      AsyncAction('_PokeApiStoreBase.fetchDataListPokemon', context: context);

  @override
  Future<void> fetchDataListPokemon() {
    return _$fetchDataListPokemonAsyncAction
        .run(() => super.fetchDataListPokemon());
  }

  late final _$fetchPokemonAsyncAction =
      AsyncAction('_PokeApiStoreBase.fetchPokemon', context: context);

  @override
  Future<void> fetchPokemon(String name) {
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
