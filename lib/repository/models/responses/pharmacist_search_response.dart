import 'package:tawzeef/shared/consts/exports.dart';

class PharmacistSearchResponse {
  int? status;
  String? message;
  List<JobModel>? jobs;

  PharmacistSearchResponse({this.status, this.message, this.jobs});

  PharmacistSearchResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['jobs'] != null) {
      jobs = <JobModel>[];
      json['jobs'].forEach((v) {
        jobs!.add(JobModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (jobs != null) {
      data['jobs'] = jobs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
