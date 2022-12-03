class ApplingListRequest {
  late String? apiToken;

  ApplingListRequest({required this.apiToken});

  ApplingListRequest.fromJson(Map<String, dynamic> json) {
    apiToken = json['apiToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apiToken'] = apiToken;
    return data;
  }
}
