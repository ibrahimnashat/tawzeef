import 'package:tawzeef/models/objects/job_type_model.dart';

class GetJobTypesResponse {
  int? status;
  String? message;
  List<JobTypeModel>? jobTypes;

  GetJobTypesResponse({this.status, this.message, this.jobTypes});

  GetJobTypesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['job'] != null) {
      jobTypes = <JobTypeModel>[];
      json['job'].forEach((v) {
        jobTypes!.add(JobTypeModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (jobTypes != null) {
      data['job'] = jobTypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
