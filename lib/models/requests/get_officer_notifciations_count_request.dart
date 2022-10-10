class GetOfficerNotificationsCountRequest {
  late String apiToken;
  GetOfficerNotificationsCountRequest({
    required this.apiToken,
  });

  GetOfficerNotificationsCountRequest.fromJson(Map<String, dynamic> json) {
    apiToken = json['apiToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apiToken'] = apiToken.toString();
    return data;
  }
}
