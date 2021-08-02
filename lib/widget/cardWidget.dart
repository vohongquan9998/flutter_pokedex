import 'package:flutter/material.dart';
import 'package:flutter_pokedex/contrant/contrant.dart';
import 'package:intl/intl.dart';

class CardTypeWidget extends StatelessWidget {
  final String type;
  CardTypeWidget({this.type});
  @override
  Widget build(BuildContext context) {
    String typeIcon = setTypeIcon(type);
    String typeText = toBeginningOfSentenceCase(type);
    return Material(
      elevation: 2,
      shadowColor: cardColors(type),
      borderRadius: BorderRadius.circular(3),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        decoration: BoxDecoration(
          color: typeColors(type),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Row(
          children: [
            Text(
              typeIcon,
              style: TextStyle(
                fontFamily: 'PokeGoTypes',
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              typeText,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.5, 2),
                      blurRadius: 3.0,
                      color: Colors.grey,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
