import 'package:flutter/material.dart';
import 'package:flutter_pokedex/contrant/contrant.dart';
import 'package:flutter_pokedex/model/pokemon.dart';
import 'package:intl/intl.dart';

class PokeAbout extends StatelessWidget {
  final Pokemon pokeData;
  PokeAbout(this.pokeData);

  String convertValue(value) {
    double convertedValue = value / 10;
    return convertedValue.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
      child: Column(
        children: [
          Text(
            'Pokedex Data',
            style: TextStyle(
              color: typeColors(pokeData.type1),
              fontSize: 17,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Flexible(
              child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              rowWidget('Đặc điểm', pokeData.species),
              rowWidget('Chiều cao', convertValue(pokeData.height) + ' m'),
              rowWidget('Cân nặng', convertValue(pokeData.weight) + ' kg'),
              rowWidget(
                'Năng lực',
                toBeginningOfSentenceCase(pokeData.ability1) +
                    '\n' +
                    toBeginningOfSentenceCase(pokeData.ability2) +
                    '\n' +
                    toBeginningOfSentenceCase(pokeData.ability3),
              ),
            ],
          )),
        ],
      ),
    );
  }

  Widget rowWidget(String text, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Text(value),
        ],
      ),
    );
  }
}
