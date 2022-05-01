// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      id: json['id'] as int?,
      name: json['name'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      stats: (json['stats'] as List<dynamic>?)
          ?.map((e) => Stats.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => Types.fromJson(e as Map<String, dynamic>))
          .toList(),
      evolution: json['evolution'] == null
          ? null
          : Evolution.fromJson(json['evolution'] as Map<String, dynamic>),
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => Abilities.fromJson(e as Map<String, dynamic>))
          .toList(),
      moves: (json['moves'] as List<dynamic>?)
          ?.map((e) => Moves.fromJson(e as Map<String, dynamic>))
          .toList(),
      sprites: json['sprites'] == null
          ? null
          : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
      'stats': instance.stats,
      'types': instance.types,
      'evolution': instance.evolution,
      'abilities': instance.abilities,
      'moves': instance.moves,
      'sprites': instance.sprites,
    };

Abilities _$AbilitiesFromJson(Map<String, dynamic> json) => Abilities(
      ability: json['ability'] == null
          ? null
          : Ability.fromJson(json['ability'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AbilitiesToJson(Abilities instance) => <String, dynamic>{
      'ability': instance.ability,
    };

Ability _$AbilityFromJson(Map<String, dynamic> json) => Ability(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
      'name': instance.name,
    };

Stats _$StatsFromJson(Map<String, dynamic> json) => Stats(
      baseStat: json['base_stat'] as int?,
      effort: json['effort'] as int?,
      stat: json['stat'] == null
          ? null
          : Stat.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };

Stat _$StatFromJson(Map<String, dynamic> json) => Stat(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Sprites _$SpritesFromJson(Map<String, dynamic> json) => Sprites(
      frontDefault: json['front_default'] as String?,
    );

Map<String, dynamic> _$SpritesToJson(Sprites instance) => <String, dynamic>{
      'front_default': instance.frontDefault,
    };

Moves _$MovesFromJson(Map<String, dynamic> json) => Moves(
      move: json['move'] == null
          ? null
          : Move.fromJson(json['move'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovesToJson(Moves instance) => <String, dynamic>{
      'move': instance.move,
    };

Move _$MoveFromJson(Map<String, dynamic> json) => Move(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$MoveToJson(Move instance) => <String, dynamic>{
      'name': instance.name,
    };

Types _$TypesFromJson(Map<String, dynamic> json) => Types(
      type: json['type'] == null
          ? null
          : Type.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypesToJson(Types instance) => <String, dynamic>{
      'type': instance.type,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'name': instance.name,
    };
