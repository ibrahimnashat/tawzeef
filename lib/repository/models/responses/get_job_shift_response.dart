import 'package:tawzeef/shared/consts/exports.dart';

class GetJobShiftResponse {
  int? status;
  String? message;
  List<JobShiftModel>? jobShifts;

  GetJobShiftResponse({this.status, this.message, this.jobShifts});

  GetJobShiftResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['job'] != null) {
      jobShifts = <JobShiftModel>[];
      json['job'].forEach((v) {
        jobShifts!.add(JobShiftModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (jobShifts != null) {
      data['job'] = jobShifts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
