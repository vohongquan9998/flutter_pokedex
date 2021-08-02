import 'package:flutter/cupertino.dart';

class Pokemon with ChangeNotifier {
  var id;
  var name;
  var sprite;
  var type1;
  var type2;
  var hp;
  var attack;
  var defense;
  var spAttack;
  var spDefense;
  var speed;
  var description;
  var height;
  var weight;
  var species;
  var ability1;
  var ability2;
  var ability3;
  var moves;

  Pokemon({
    this.id,
    this.name,
    this.sprite,
    this.type1,
    this.type2,
    this.hp,
    this.attack,
    this.defense,
    this.spAttack,
    this.spDefense,
    this.speed,
    this.description,
    this.height,
    this.weight,
    this.species,
    this.ability1,
    this.ability2,
    this.ability3,
    this.moves,
  });

  factory Pokemon.fromJson(
      Map<String, dynamic> json, Map<String, dynamic> secJson) {
    String pokeID = json['id'].toString();
    int hp = json['stats'][0]['base_stat'];
    int att = json['stats'][1]['base_stat'];
    int def = json['stats'][2]['base_stat'];
    int spAtt = json['stats'][3]['base_stat'];
    int spDef = json['stats'][4]['base_stat'];
    int speed = json['stats'][5]['base_stat'];

    List descList = secJson['flavor_text_entries'];
    int descIndex;
    for (int i = 0; i < descList.length; i++) {
      var desc = secJson['flavor_text_entries'][i]['language']['name'];
      if (desc == 'en') descIndex = i;
    }
    String pokeDescription =
        secJson['flavor_text_entries'][descIndex]['flavor_text'];
    String pokeSpec = secJson['genera'][7]['genus'];
    double pokeHP = hp / 100;
    double pokeAtt = att / 100;
    double pokeDef = def / 100;
    double pokeSpAtt = spAtt / 100;
    double pokeSpDef = spDef / 100;
    double pokeSpeed = speed / 100;

    List abilities = json['abilities'];
    List types = json['types'];
    List movesList = json['moves'];
    List tempMovesList = [];
    for (int i = 0; i < movesList.length; i++) {
      var moves = json['moves'][i]['move']['name'];
      tempMovesList.add(moves);
    }
    return Pokemon(
      id: pokeID,
      name: json['name'],
      sprite: json['sprites']['front_default'],
      //sprite: json['sprites']['back_default'],
      type1: json['types'][0]['type']['name'],
      type2: types.length == 2 ? json['types'][1]['type']['name'] : null,
      hp: pokeHP,
      attack: pokeAtt,
      defense: pokeDef,
      speed: pokeSpeed,
      spAttack: pokeSpAtt,
      spDefense: pokeSpDef,
      description: pokeDescription,
      height: json['height'],
      weight: json['weight'],
      species: pokeSpec,
      ability1: json['abilities'][0]['ability']['name'],
      ability2:
          abilities.length >= 2 ? json['abilities'][1]['ability']['name'] : '',
      ability3:
          abilities.length >= 3 ? json['abilities'][2]['ability']['name'] : '',
      moves: tempMovesList,
    );
  }
}
