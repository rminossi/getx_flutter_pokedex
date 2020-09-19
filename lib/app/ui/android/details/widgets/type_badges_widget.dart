import 'package:flutter/material.dart';
import 'package:pokedex/app/constants/app_constantts.dart';

class TypeBadges extends StatelessWidget {

  final List type;

  const TypeBadges({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> lista = [];
    type.forEach((nome) {
      lista.add(
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ConstsApp.getColorType(nome),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  nome.trim(),
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      );
    });
    return Row(
      children: lista,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}