class CareerLevelModel {
  int? id;
  String? career;

  CareerLevelModel({this.id, this.career});

  CareerLevelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    career = json['career'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['career'] = career;
    return data;
  }
}
