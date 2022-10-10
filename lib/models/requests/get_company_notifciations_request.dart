class GetCompanyNotificationsRequest {
  late String apiToken;
  GetCompanyNotificationsRequest({
    required this.apiToken,
  });

  GetCompanyNotificationsRequest.fromJson(Map<String, dynamic> json) {
    apiToken = json['apiToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apiToken'] = apiToken.toString();
    return data;
  }
}
