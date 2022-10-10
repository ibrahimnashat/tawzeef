class ChangePasswordRequest {
  late String password;
  late String apiToken;
  ChangePasswordRequest({
    required this.password,
    required this.apiToken,
  });

  ChangePasswordRequest.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    apiToken = json['apiToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['password'] = password;
    data['apiToken'] = apiToken;
    return data;
  }
}
