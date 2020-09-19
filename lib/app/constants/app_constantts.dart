import 'package:flutter/material.dart';

class ConstsApp{
  static const String pokedex = 'assets/images/pokedex.png';
  static const String pokeball = 'assets/images/pb.png';
  static const String bg_home = 'assets/images/bg_home.jpg';
  static const String bg_home2 = 'assets/images/bg_home.png';

  static Color getColorType(String type) {
    print(type);
    switch (type) {
      case 'Normal':
        return Colors.brown[400].withOpacity(0.3);
        break;
      case 'Fire':
        return Colors.red.withOpacity(0.3);
        break;
      case 'Water':
        return Colors.blue.withOpacity(0.3);
        break;
      case 'Grass':
        return Colors.green.withOpacity(0.3);
        break;
      case 'Electric':
        return Colors.amber.withOpacity(0.3);
        break;
      case 'Ice':
        return Colors.cyanAccent[400].withOpacity(0.3);
        break;
      case 'Fighting':
        return Colors.orange.withOpacity(0.3);
        break;
      case 'Poison':
        return Colors.purple.withOpacity(0.3);
        break;
      case 'Ground':
        return Colors.orange[300].withOpacity(0.3);
        break;
      case 'Flying':
        return Colors.indigo[200].withOpacity(0.3);
        break;
      case 'Psychic':
        return Colors.pink.withOpacity(0.3);
        break;
      case 'Bug':
        return Colors.lightGreen[500].withOpacity(0.3);
        break;
      case 'Rock':
        return Colors.grey.withOpacity(0.3);
        break;
      case 'Ghost':
        return Colors.indigo[400].withOpacity(0.3);
        break;
      case 'Dark':
        return Colors.brown.withOpacity(0.3);
        break;
      case 'Dragon':
        return Colors.indigo[800].withOpacity(0.3);
        break;
      case 'Steel':
        return Colors.blueGrey.withOpacity(0.3);
        break;
      case 'Fairy':
        return Colors.pinkAccent[100].withOpacity(0.3);
        break;
      default:
        return Colors.grey.withOpacity(0.3);
        break;
    }
  }
}