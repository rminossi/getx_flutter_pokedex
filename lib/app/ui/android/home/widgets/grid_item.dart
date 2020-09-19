import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/app/constants/app_constantts.dart';
import 'package:pokedex/app/ui/android/details/widgets/type_badges_widget.dart';

class GridPokemonItem extends StatelessWidget {
  final String name;
  final String index;
  final String color;
  final String num;
  final List type;
  const GridPokemonItem(
      {Key key, this.name, this.index, this.color, this.num, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.8),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '$num - $name',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.0, -0.4),
              child: CachedNetworkImage(
                height: 90,
                width: 90,
                placeholder: (context, url) => new Container(
                  color: Colors.transparent,
                ),
                imageUrl:
                    'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png',
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    color: ConstsApp.getColorType(type[0]),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          type.length > 1 ? "Types" : "Type",
                          style: TextStyle(color: Colors.white, fontSize: 7),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TypeBadges(type: type)
                    ]
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
