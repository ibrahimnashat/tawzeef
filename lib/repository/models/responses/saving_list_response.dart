import 'package:tawzeef/repository/models/objects/job_model.dart';

class SavingListResponse {
  int? status;
  String? message;
  List<JobModel>? job;

  SavingListResponse({this.status, this.message, this.job});

  SavingListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['job'] != null) {
      job = <JobModel>[];
      json['job'].forEach((v) {
        job!.add(JobModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (job != null) {
      data['job'] = job!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
