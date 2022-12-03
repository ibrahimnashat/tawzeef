class JobTitleModel {
  String? title;
  int? id;

  JobTitleModel({this.title, this.id});

  JobTitleModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['id'] = id;
    return data;
  }
}
