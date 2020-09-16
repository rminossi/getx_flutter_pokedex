import 'package:flutter/material.dart';

class GridPokemonItem extends StatelessWidget {
  final String name;
  final String index;
  final String color;
  final Widget image;
  final List<String> type;
  const GridPokemonItem(
      {Key key, this.name, this.index, this.color, this.image, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Stack(
          children: [
            image,
          ],
        ),
      ),
    );
  }
}
