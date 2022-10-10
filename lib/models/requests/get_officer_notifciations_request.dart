class GetOfficerNotificationsRequest {
  late String apiToken;
  GetOfficerNotificationsRequest({
    required this.apiToken,
  });

  GetOfficerNotificationsRequest.fromJson(Map<String, dynamic> json) {
    apiToken = json['apiToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apiToken'] = apiToken.toString();
    return data;
  }
}
