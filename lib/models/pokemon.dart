import 'package:json_annotation/json_annotation.dart';

import 'package:pokedart/models/evolution.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  int? id;
  String? name;
  double? weight;
  List<Stats>? stats;
  List<Types>? types;
  Evolution? evolution;
  List<Abilities>? abilities;
  List<Moves>? moves;
  Sprites? sprites;
  @JsonKey(name: 'is_baby')
  bool? isBaby;
  @JsonKey(name: 'is_legendary')
  bool? isLegendary;
  @JsonKey(name: 'is_mythical')
  bool? isMythical;

  Pokemon({
    this.id,
    this.name,
    this.weight,
    this.stats,
    this.types,
    this.evolution,
    this.abilities,
    this.moves,
    this.sprites,
    this.isBaby,
    this.isLegendary,
    this.isMythical,
  });
  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  Pokemon copyWith({
    int? id,
    String? name,
    double? weight,
    List<Stats>? stats,
    List<Types>? types,
    Evolution? evolution,
    List<Abilities>? abilities,
    List<Moves>? moves,
    Sprites? sprites,
    bool? isBaby,
    bool? isLegendary,
    bool? isMythical,
  }) {
    return Pokemon(
      id: id ?? this.id,
      name: name ?? this.name,
      weight: weight ?? this.weight,
      stats: stats ?? this.stats,
      types: types ?? this.types,
      evolution: evolution ?? this.evolution,
      abilities: abilities ?? this.abilities,
      moves: moves ?? this.moves,
      sprites: sprites ?? this.sprites,
      isBaby: isBaby ?? this.isBaby,
      isLegendary: isLegendary ?? this.isLegendary,
      isMythical: isMythical ?? this.isMythical,
    );
  }
}

@JsonSerializable()
class Abilities {
  Ability? ability;

  Abilities({
    this.ability,
  });

  factory Abilities.fromJson(Map<String, dynamic> json) =>
      _$AbilitiesFromJson(json);
  Map<String, dynamic> toJson() => _$AbilitiesToJson(this);
}

@JsonSerializable()
class Ability {
  String? name;

  Ability({
    this.name,
  });
  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);
  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}

@JsonSerializable()
class Stats {
  @JsonKey(name: 'base_stat')
  int? baseStat;
  int? effort;
  Stat? stat;

  Stats({
    this.baseStat,
    this.effort,
    this.stat,
  });
  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
  Map<String, dynamic> toJson() => _$StatsToJson(this);
}

@JsonSerializable()
class Stat {
  String? name;
  String? url;

  Stat({
    this.name,
    this.url,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);
  Map<String, dynamic> toJson() => _$StatToJson(this);
}

@JsonSerializable()
class Sprites {
  @JsonKey(name: 'front_default')
  String? frontDefault;
  Sprites({
    this.frontDefault,
  });
  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);
  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}

@JsonSerializable()
class Moves {
  Move? move;
  Moves({
    this.move,
  });
  factory Moves.fromJson(Map<String, dynamic> json) => _$MovesFromJson(json);
  Map<String, dynamic> toJson() => _$MovesToJson(this);
}

@JsonSerializable()
class Move {
  String? name;
  Move({
    this.name,
  });
  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);
  Map<String, dynamic> toJson() => _$MoveToJson(this);
}

@JsonSerializable()
class Types {
  Type? type;
  Types({
    this.type,
  });
  factory Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);
  Map<String, dynamic> toJson() => _$TypesToJson(this);
}

@JsonSerializable()
class Type {
  String? name;
  Type({
    this.name,
  });
  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
  Map<String, dynamic> toJson() => _$TypeToJson(this);
}
