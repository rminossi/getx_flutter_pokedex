import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pokedex/app/data/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:cached_network_image/cached_network_image.dart';

const baseUrl = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

class MyApiClient {

final http.Client httpClient;
MyApiClient({@required this.httpClient});

getAll() async {
  try {
    var response = await httpClient.get(baseUrl);
    if(response.statusCode == 200){
      Iterable jsonResponse = json.decode(response.body)["pokemon"];
        List<PokemonModel> listPokemonModel = jsonResponse.map((model) => PokemonModel.fromJson(model)).toList();
      return listPokemonModel;
    }else print ('erro');
  } catch(_){ }
}

Widget getImage(String numero) {
    return CachedNetworkImage(
      placeholder: (context, url) => new Container(
        color: Colors.red,
      ),
      imageUrl:
          'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$numero.png',
    );
  }

getId(id) async {
  try {
    var response = await httpClient.get('baseUrlid');
    if(response.statusCode == 200){
      //Map<String, dynamic> jsonResponse = json.decode(response.body);
    }else print ('erro -get');
  } catch(_){ }
}


}