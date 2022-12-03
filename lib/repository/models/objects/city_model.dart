class CityModel {
  int? id;
  String? city;

  CityModel({this.id, this.city});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['city'] = city;
    return data;
  }
}
