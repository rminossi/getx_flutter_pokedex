import 'package:get/get.dart';
import 'package:pokedex/app/data/model/model.dart';
import 'package:pokedex/app/data/repository/posts_repository.dart';
import 'package:meta/meta.dart';

class DetailsController extends GetxController {

  final MyRepository repository;
  DetailsController({@required this.repository}) : assert(repository != null);

  final _pokemon = PokemonModel().obs;
  get pokemon => this._pokemon.value;
  set pokemon(value) => this._pokemon.value = value;

  editar(pokemon){
    print('editar');
  }
  delete(id){
    print('deletar');
  }
}