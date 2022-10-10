class ChangeUserApplicationStatusRequest {
  late int jobId;
  late int userId;
  late String? apiToken;
  late String? status;

  ChangeUserApplicationStatusRequest({
    required this.jobId,
    required this.apiToken,
    required this.status,
    required this.userId,
  });

  ChangeUserApplicationStatusRequest.fromJson(Map<String, dynamic> json) {
    apiToken = json['apiToken'];
    jobId = json['job_id'];
    userId = json['user_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (status != null) data['status'] = status;
    data['apiToken'] = apiToken;
    data['job_id'] = jobId.toString();
    data['user_id'] = userId.toString();
    return data;
  }
}
