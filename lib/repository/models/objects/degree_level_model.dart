class DegreeLevelModel {
  int? id;
  String? degreeLevel;

  DegreeLevelModel({this.id, this.degreeLevel});

  DegreeLevelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    degreeLevel = json['degreeLevel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['degreeLevel'] = degreeLevel;
    return data;
  }
}
