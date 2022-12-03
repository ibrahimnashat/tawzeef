class IndustryModel {
  int? id;
  String? industry;

  IndustryModel({this.id, this.industry});

  IndustryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    industry = json['industry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['industry'] = industry;
    return data;
  }
}
