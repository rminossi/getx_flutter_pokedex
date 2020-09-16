class PokemonModel {
  
  String num;
  String name;
  
  PokemonModel({ num, name});

  PokemonModel.fromJson(Map<String, dynamic> json){
      this.num = json['num'];
      this.name = json['name'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['num'] = this.num;
    return data;
  }
}