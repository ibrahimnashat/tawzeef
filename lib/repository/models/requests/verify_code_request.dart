class VerifyCodeRequest {
  late String? email;
  late String? apiToken;
  late String code;

  VerifyCodeRequest({
    this.apiToken,
    this.email,
    required this.code,
  });

  VerifyCodeRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    apiToken = json['apiToken'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (email != null) data['email'] = email;
    if (apiToken != null) data['apiToken'] = apiToken;
    return data;
  }
}
