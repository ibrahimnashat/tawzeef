class ResendCodeRequest {
  late String? fcmToken;
  late String? apiToken;

  ResendCodeRequest({
    this.apiToken,
    this.fcmToken,
  });

  ResendCodeRequest.fromJson(Map<String, dynamic> json) {
    fcmToken = json['fcm_token'];
    apiToken = json['apiToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fcm_token'] = fcmToken;
    data['apiToken'] = apiToken;
    return data;
  }
}
