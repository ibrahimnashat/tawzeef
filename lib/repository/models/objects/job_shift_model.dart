class JobShiftModel {
  int? id;
  String? jobshift;

  JobShiftModel({this.id, this.jobshift});

  JobShiftModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobshift = json['jobshift'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['jobshift'] = jobshift;
    return data;
  }
}
