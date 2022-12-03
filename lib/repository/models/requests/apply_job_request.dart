class ApplyJobRequest {
  late int jobId;
  late String? apiToken;

  ApplyJobRequest({required this.jobId, required this.apiToken});

  ApplyJobRequest.fromJson(Map<String, dynamic> json) {
    apiToken = json['apiToken'];
    jobId = json['job_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apiToken'] = apiToken;
    data['job_id'] = jobId.toString();
    return data;
  }
}
