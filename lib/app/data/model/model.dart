class PokemonModel {
  int id;
  String num;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  String candyCount;
  String egg;
  List<NextEvolution> nextEvolution;
  List<PrevEvolution> prevEvolution;

  PokemonModel(
      {this.id,
      this.num,
      this.name,
      this.img,
      this.type,
      this.height,
      this.weight,
      this.candyCount,
      this.egg,
      this.nextEvolution,
      this.prevEvolution});

  PokemonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    num = json['num'];
    name = json['name'];
    img = json['img'];
    type = json['type'].cast<String>();
    height = json['height'];
    weight = json['weight'];
    candyCount = json['candyCount'];
    egg = json['egg'];
    if (json['next_evolution'] != null) {
      nextEvolution = new List<NextEvolution>();
      json['next_evolution'].forEach((v) {
        nextEvolution.add(new NextEvolution.fromJson(v));
      });
    }
    if (json['prev_evolution'] != null) {
      prevEvolution = new List<PrevEvolution>();
      json['prev_evolution'].forEach((v) {
        prevEvolution.add(new PrevEvolution.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['num'] = this.num;
    data['name'] = this.name;
    data['img'] = this.img;
    data['type'] = this.type;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['candyCount'] = this.candyCount;
    data['egg'] = this.egg;
    if (this.nextEvolution != null) {
      data['next_evolution'] =
          this.nextEvolution.map((v) => v.toJson()).toList();
    }
    if (this.prevEvolution != null) {
      data['prev_evolution'] =
          this.prevEvolution.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NextEvolution {
  String num;
  String name;

  NextEvolution({this.num, this.name});

  NextEvolution.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num'] = this.num;
    data['name'] = this.name;
    return data;
  }
}


class PrevEvolution {
  String num;
  String name;

  PrevEvolution({this.num, this.name});

  PrevEvolution.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num'] = this.num;
    data['name'] = this.name;
    return data;
  }
}