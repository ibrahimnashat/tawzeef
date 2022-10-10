class GetJobTypesRequest {
  late String apiToken;
  GetJobTypesRequest({
    required this.apiToken,
  });

  GetJobTypesRequest.fromJson(Map<String, dynamic> json) {
    apiToken = json['apiToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apiToken'] = apiToken.toString();
    return data;
  }
}
