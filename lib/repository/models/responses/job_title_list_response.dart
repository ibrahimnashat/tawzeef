import 'package:tawzeef/repository/models/objects/job_title_model.dart';

class JopTitleListResponse {
  int? status;
  String? message;
  List<JobTitleModel>? job;

  JopTitleListResponse({this.status, this.message, this.job});

  JopTitleListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['job'] != null) {
      job = <JobTitleModel>[];
      json['job'].forEach((v) {
        job!.add(JobTitleModel.fromJson(v));
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
