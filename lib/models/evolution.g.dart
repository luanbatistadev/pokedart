// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chain _$ChainFromJson(Map<String, dynamic> json) => Chain(
      evolvesTo: (json['evolves_to'] as List<dynamic>?)
          ?.map((e) => EvolvesTo.fromJson(e as Map<String, dynamic>))
          .toList(),
      species: json['species'] == null
          ? null
          : Species.fromJson(json['species'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChainToJson(Chain instance) => <String, dynamic>{
      'evolves_to': instance.evolvesTo,
      'species': instance.species,
    };

Species _$SpeciesFromJson(Map<String, dynamic> json) => Species(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SpeciesToJson(Species instance) => <String, dynamic>{
      'name': instance.name,
    };

EvolvesTo _$EvolvesToFromJson(Map<String, dynamic> json) => EvolvesTo(
      species: json['species'] == null
          ? null
          : Species.fromJson(json['species'] as Map<String, dynamic>),
      evolvesTo: (json['evolves_to'] as List<dynamic>?)
          ?.map((e) => EvolvesTo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EvolvesToToJson(EvolvesTo instance) => <String, dynamic>{
      'species': instance.species,
      'evolves_to': instance.evolvesTo,
    };

Evolution _$EvolutionFromJson(Map<String, dynamic> json) => Evolution(
      chain: json['chain'] == null
          ? null
          : Chain.fromJson(json['chain'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EvolutionToJson(Evolution instance) => <String, dynamic>{
      'chain': instance.chain,
    };

EvolutionChain _$EvolutionChainFromJson(Map<String, dynamic> json) =>
    EvolutionChain(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$EvolutionChainToJson(EvolutionChain instance) =>
    <String, dynamic>{
      'url': instance.url,
    };
