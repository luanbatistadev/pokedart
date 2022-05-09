import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedart/models/evolution.dart';
import 'package:pokedart/models/pokemon.dart';

Future<List<Pokemon>> fetchPokemonsFromApi() async {
  final response = await http.get(
    Uri.parse(
      'https://pokeapi.co/api/v2/pokemon-species?limit=100000&offset=0',
    ),
  );
  final Map<String,dynamic> json = jsonDecode(response.body) as Map<String,dynamic>;
  final pokemonsJson = json['results'] as List;
  final pokemons = pokemonsJson.map((e) => Pokemon.fromJson(e as Map<String, dynamic>)).toList();
  return pokemons;
}

Future<Pokemon> fetchDataPokemon(String name) async {
  EvolutionChain evolutionChain = EvolutionChain();
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));
  final json = jsonDecode(response.body);
  final pokemonsJson = json as Map<String, dynamic>;
  final pokemon = Pokemon.fromJson(pokemonsJson);

  final responseEvolution = await http
      .get(Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$name'));
  if (responseEvolution.statusCode == 200) {
    final Map<String,dynamic> jsonEvolution = jsonDecode(responseEvolution.body) as Map<String,dynamic>;
    final  evolutionJson =
        jsonEvolution['evolution_chain'] as Map<String, dynamic>;
    evolutionChain = EvolutionChain.fromJson(evolutionJson);
  }

  final responseAbilities = await http.get(Uri.parse(evolutionChain.url!));
  if (responseAbilities.statusCode == 200) {
    final jsonAbilities = jsonDecode(responseAbilities.body);
    final evolutionJson = jsonAbilities as Map<String, dynamic>;
    final evolution = Evolution.fromJson(evolutionJson);
    return pokemon.copyWith(evolution: evolution);
  } else {
    return pokemon;
  }
}
