class GetMyJobsRequest {
  late String apiToken;

  GetMyJobsRequest({required this.apiToken});

  GetMyJobsRequest.fromJson(Map<String, dynamic> json) {
    apiToken = json['apiToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apiToken'] = apiToken;
    return data;
  }
}
