import 'package:json_annotation/json_annotation.dart';
part 'evolution.g.dart';



@JsonSerializable()
class Chain {
  Chain({this.evolvesTo, this.species});
  @JsonKey(name: 'evolves_to')
  final List<EvolvesTo>? evolvesTo;
  final Species? species;
  factory Chain.fromJson(Map<String, dynamic> json) => _$ChainFromJson(json);
  Map<String, dynamic> toJson() => _$ChainToJson(this);
}

@JsonSerializable()
class Species {
  Species({this.name});
  final String? name;
  factory Species.fromJson(Map<String, dynamic> json) => _$SpeciesFromJson(json);
  Map<String, dynamic> toJson() => _$SpeciesToJson(this);
}

@JsonSerializable()
class EvolvesTo {
  EvolvesTo({this.species, this.evolvesTo});
  final Species? species;
  @JsonKey(name: 'evolves_to')
  final List<EvolvesTo>? evolvesTo;
  factory EvolvesTo.fromJson(Map<String, dynamic> json) => _$EvolvesToFromJson(json);
  Map<String, dynamic> toJson() => _$EvolvesToToJson(this);
}

@JsonSerializable()
class Evolution {
  Evolution({this.chain});
  final Chain? chain;
  factory Evolution.fromJson(Map<String, dynamic> json) => _$EvolutionFromJson(json);
  Map<String, dynamic> toJson() => _$EvolutionToJson(this);
}

@JsonSerializable()
class EvolutionChain{
  EvolutionChain({this.url});
  final String? url;
  factory EvolutionChain.fromJson(Map<String, dynamic> json) => _$EvolutionChainFromJson(json);
  Map<String, dynamic> toJson() => _$EvolutionChainToJson(this);
}
