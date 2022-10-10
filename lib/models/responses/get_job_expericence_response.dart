import 'package:tawzeef/models/objects/job_experience_model.dart';

class GetJobExperienceResponse {
  int? status;
  String? message;
  List<JobExperienceModel>? jobExperience;

  GetJobExperienceResponse({this.status, this.message, this.jobExperience});

  GetJobExperienceResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['job'] != null) {
      jobExperience = <JobExperienceModel>[];
      json['job'].forEach((v) {
        jobExperience!.add(JobExperienceModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (jobExperience != null) {
      data['job'] = jobExperience!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
