import 'package:tawzeef/repository/models/objects/ad_model.dart';
import 'package:tawzeef/repository/models/objects/job_model.dart';

class PharmacistHomeResponse {
  int? status;
  String? message;
  List<JobModel>? jobs;
  List<AdModel>? ads;

  PharmacistHomeResponse({this.status, this.message, this.jobs});

  PharmacistHomeResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['jobs'] != null) {
      jobs = <JobModel>[];
      json['jobs'].forEach((v) {
        jobs!.add(JobModel.fromJson(v));
      });
    }
    if (json['ads'] != null) {
      ads = <AdModel>[];
      json['ads'].forEach((v) {
        ads!.add(AdModel.fromJson(v));
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
    if (ads != null) {
      data['ads'] = ads!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
