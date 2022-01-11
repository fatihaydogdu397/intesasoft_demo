class DetailModel {
  DetailModel({
    required this.name,
    required this.created,
    required this.description,
    required this.image,
    required this.populations,
    required this.id,
  });
  late final String name;
  late final String created;
  late final dynamic description;
  late final dynamic image;
  late final List<Populations> populations;
  late final String id;

  DetailModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    created = json['created'];
    description = json['description'];
    image = json['image'];
    populations = List.from(json['populations'])
        .map((e) => Populations.fromJson(e))
        .toList();
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['created'] = created;
    _data['description'] = description;
    _data['image'] = image;
    _data['populations'] = populations.map((e) => e.toJson()).toList();
    _data['id'] = id;
    return _data;
  }
}

class Populations {
  Populations({
    required this.year,
    required this.population,
  });
  late final int year;
  late final String population;

  Populations.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    population = json['population'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['year'] = year;
    _data['population'] = population;
    return _data;
  }
}
