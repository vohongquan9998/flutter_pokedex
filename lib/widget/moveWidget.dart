import 'package:flutter/material.dart';
import 'package:flutter_pokedex/contrant/contrant.dart';
import 'package:flutter_pokedex/model/pokemon.dart';
import 'package:intl/intl.dart';

class PokeMoves extends StatelessWidget {
  final Pokemon pokeData;
  PokeMoves(this.pokeData);
  @override
  Widget build(BuildContext context) {
    final List moveList = pokeData.moves;
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: GridView.count(
        crossAxisCount: 3,
        padding: EdgeInsets.zero,
        mainAxisSpacing: 4,
        childAspectRatio: 6 / 1.5,
        crossAxisSpacing: 4,
        children: moveList.map((item) => moveWidget(item, pokeData)).toList(),
      ),
    );
  }

  Widget moveWidget(String text, dynamic pokeData) {
    return Container(
      decoration: BoxDecoration(
        color: typeColors(pokeData.type1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          toBeginningOfSentenceCase(text),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 7,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
