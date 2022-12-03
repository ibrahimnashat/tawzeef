class ViewJobRequest {
  late int jobId;

  ViewJobRequest({required this.jobId});

  ViewJobRequest.fromJson(Map<String, dynamic> json) {
    jobId = json['job_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['job_id'] = jobId.toString();
    return data;
  }
}
