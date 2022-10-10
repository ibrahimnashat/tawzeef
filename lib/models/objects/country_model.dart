class CountryModel {
  int? id;
  String? country;

  CountryModel({this.id, this.country});

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['country'] = country;
    return data;
  }
}
