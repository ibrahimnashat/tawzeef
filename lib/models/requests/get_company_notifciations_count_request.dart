class GetCompanyNotificationsCountRequest {
  late String apiToken;
  GetCompanyNotificationsCountRequest({
    required this.apiToken,
  });

  GetCompanyNotificationsCountRequest.fromJson(Map<String, dynamic> json) {
    apiToken = json['apiToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apiToken'] = apiToken.toString();
    return data;
  }
}
