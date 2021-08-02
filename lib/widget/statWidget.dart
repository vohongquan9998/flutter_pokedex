import 'package:flutter/material.dart';
import 'package:flutter_pokedex/contrant/contrant.dart';
import 'package:flutter_pokedex/model/pokemon.dart';

class PokeStats extends StatelessWidget {
  final Pokemon pokeData;
  PokeStats({this.pokeData});

  String convertValue(value) {
    double initValue = value * 100;
    return initValue.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          statBar('HP', pokeData.hp),
          statBar('ATK', pokeData.attack),
          statBar('DEF', pokeData.defense),
          statBar('SATK', pokeData.spAttack),
          statBar('SDEF', pokeData.spDefense),
          statBar('SPD', pokeData.speed),
        ],
      ),
    );
  }

  Widget statBar(String label, double value) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: typeColors(
                pokeData.type1,
              ),
            ),
          ),
          Spacer(),
          Text(
            convertValue(value),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: typeColors(
                pokeData.type1,
              ),
            ),
          ),
          Container(
            width: 250,
            height: 10,
            margin: EdgeInsets.only(left: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(
                  typeColors(
                    pokeData.type1,
                  ),
                ),
                value: value,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
