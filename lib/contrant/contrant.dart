import 'package:flutter/material.dart';

Color cardColors(String type) {
  type = type.toLowerCase();
  if (type == null) {
    return Colors.white70;
  }
  switch (type) {
    case 'fire':
      return Colors.orange[200];
      break;
    case 'grass':
      return Colors.green[200];
      break;
    case 'water':
      return Colors.blue[200];
      break;
    case 'rock':
      return Colors.amberAccent[100];
      break;
    case 'bug':
      return Colors.lightGreen[100];
      break;
    case 'normal':
      return Colors.grey[350];
      break;
    case 'poison':
      return Colors.purple[200];
      break;
    case 'electric':
      return Colors.yellow[200];
      break;
    case 'ice':
      return Colors.lightBlueAccent[100];
      break;
    case 'fairy':
      return Colors.pink[100];
      break;
    case 'flying':
      return Colors.indigo[200];
      break;
    case 'dark':
      return Colors.brown[200];
      break;
    case 'psychic':
      return Colors.pink[200];
      break;
    case 'dragon':
      return Colors.deepPurple[200];
      break;
    case 'ghost':
      return Colors.purple[300];
      break;
    case 'steel':
      return Colors.blueGrey[200];
      break;
    case 'ground':
      return Colors.amber[200];
      break;
    case 'fighting':
      return Colors.deepOrange[200];
      break;
    default:
      return Colors.white70;
  }
}

Color typeColors(String type) {
  type = type.toLowerCase();
  if (type == null) {
    return Colors.white70;
  }
  switch (type) {
    case 'fire':
      return Colors.orange;
      break;
    case 'grass':
      return Colors.green;
      break;
    case 'water':
      return Colors.blue[400];
      break;
    case 'rock':
      return Colors.amberAccent;
      break;
    case 'bug':
      return Colors.lightGreen;
      break;
    case 'normal':
      return Colors.grey[400];
      break;
    case 'poison':
      return Colors.purple;
      break;
    case 'electric':
      return Colors.yellowAccent[700];
      break;
    case 'ice':
      return Colors.lightBlueAccent;
      break;
    case 'fairy':
      return Colors.pink[200];
      break;
    case 'flying':
      return Colors.indigo[400];
      break;
    case 'dark':
      return Colors.brown[700];
      break;
    case 'psychic':
      return Colors.pink;
      break;
    case 'dragon':
      return Colors.deepPurple;
      break;
    case 'ghost':
      return Colors.purple[900];
      break;
    case 'steel':
      return Colors.blueGrey;
      break;
    case 'ground':
      return Colors.amber[500];
      break;
    case 'fighting':
      return Colors.deepOrange[500];
      break;
    default:
      return Colors.white70;
  }
}

String setTypeIcon(String type) {
  switch (type) {
    case 'fire':
      return 'G';
      break;
    case 'grass':
      return 'J';
      break;
    case 'water':
      return 'R';
      break;
    case 'rock':
      return 'P';
      break;
    case 'bug':
      return 'A';
      break;
    case 'normal':
      return 'M';
      break;
    case 'poison':
      return 'N';
      break;
    case 'electric':
      return 'D';
      break;
    case 'ground':
      return 'K';
      break;
    case 'ice':
      return 'L';
      break;
    case 'dark':
      return 'B';
      break;
    case 'fairy':
      return 'E';
      break;
    case 'psychic':
      return 'O';
      break;
    case 'fighting':
      return 'F';
      break;
    case 'ghost':
      return 'I';
      break;
    case 'flying':
      return 'H';
      break;
    case 'dragon':
      return 'C';
      break;
    case 'steel':
      return 'Q';
      break;
    default:
      return 'A';
  }
}
