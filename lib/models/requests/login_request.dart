class LoginRequest {
  late String email;
  late String password;
  String? fCMToken;
  String? lang;
  String? type;

  LoginRequest({
    required this.email,
    required this.password,
    this.fCMToken,
    this.lang,
    this.type,
  });

  LoginRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    fCMToken = json['fcm_token'];
    lang = json['lang'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['type'] = type;
    if (fCMToken != null) data['fcm_token'] = fCMToken;
    if (lang != null) data['lang'] = lang;
    return data;
  }
}
