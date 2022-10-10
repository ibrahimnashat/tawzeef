class GetUsersOfJobRequest {
  late int jobId;
  late String? apiToken;
  String? status;

  GetUsersOfJobRequest({
    required this.jobId,
    required this.apiToken,
    this.status,
  });

  GetUsersOfJobRequest.fromJson(Map<String, dynamic> json) {
    apiToken = json['apiToken'];
    jobId = json['job_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apiToken'] = apiToken;
    if (status != null) data['status'] = status;
    data['job_id'] = jobId.toString();
    return data;
  }
}
