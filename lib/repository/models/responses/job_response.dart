import 'package:tawzeef/repository/models/objects/job_model.dart';

class JopResponse {
  int? status;
  String? message;
  JobModel? job;
  int? isSaved;
  int? isApply;
  int? applyingCount;

  JopResponse({this.status, this.message, this.job});

  JopResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    isSaved = json['isSaved'];
    isApply = json['isApply'];
    applyingCount = json['applyingCount'];
    job = json['job'] != null ? JobModel.fromJson(json['job']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['isSaved'] = isSaved;
    data['isApply'] = isApply;
    data['applyingCount'] = applyingCount;
    if (job != null) {
      data['job'] = job!.toJson();
    }
    return data;
  }
}
