class JobTypeModel {
  int? id;
  String? jobtype;

  JobTypeModel({this.id, this.jobtype});

  JobTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobtype = json['jobtype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['jobtype'] = jobtype;
    return data;
  }
}
