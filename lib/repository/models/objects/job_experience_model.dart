class JobExperienceModel {
  int? id;
  String? jobexperience;

  JobExperienceModel({this.id, this.jobexperience});

  JobExperienceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobexperience = json['jobexperience'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['jobexperience'] = jobexperience;
    return data;
  }
}
