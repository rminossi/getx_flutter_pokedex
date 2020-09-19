import 'package:get/get.dart';
import 'package:pokedex/app/data/model/model.dart';
import 'package:pokedex/app/data/repository/posts_repository.dart';
import 'package:pokedex/app/routes/app_pages.dart';
import 'package:meta/meta.dart';

class HomeController extends GetxController {

  final MyRepository repository;
  HomeController({@required this.repository}) : assert(repository != null);

  final _pokemonList = List<PokemonModel>().obs;
  get pokemonList => this._pokemonList.value;
  set pokemonList(value) => this._pokemonList.value = value;
  
  final _pokemon = PokemonModel().obs;
  get pokemon => this._pokemon.value;
  set pokemon(value) => this._pokemon.value = value;
  
  getAll(){
    repository.getAll().then( (data){ this.pokemonList = data;} );
  }

  getImage(String num) {
    return repository.getImage(num);
  }
  details(pokemon){
    this.pokemon = pokemon;
    Get.toNamed(Routes.DETAILS);
  }
}