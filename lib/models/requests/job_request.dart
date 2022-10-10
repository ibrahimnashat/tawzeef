class JobRequest {
  late int jobId;
  late String apiToken;

  JobRequest({
    required this.jobId,
    required this.apiToken,
  });

  JobRequest.fromJson(Map<String, dynamic> json) {
    jobId = json['job_id'];
    apiToken = json['apiToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['job_id'] = jobId.toString();
    data['apiToken'] = apiToken;
    return data;
  }
}
