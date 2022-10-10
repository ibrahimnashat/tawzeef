import 'package:tawzeef/models/objects/job_model.dart';

class EditJobResponse {
  int? status;
  String? message;
  JobModel? job;

  EditJobResponse({this.status, this.message, this.job});

  EditJobResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['job'] != null) {
      job = JobModel.fromJson(json['job']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (job != null) {
      data['job'] = job!.toJson();
    }
    return data;
  }
}
