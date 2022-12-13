class RegisterRequest {
  late String email;
  late String password;
  late String phone;
  late String name;
  String? fCMToken;
  String? lang;
  String? type;

  RegisterRequest({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.type,
    this.fCMToken,
    this.lang,
  });

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    type = json['type'];
    password = json['password'];
    phone = json['phone'];
    name = json['name'];
    fCMToken = json['fcm_token'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['type'] = type;
    data['name'] = name;
    data['phone'] = phone;
    if (fCMToken != null) data['fcm_token'] = fCMToken;
    if (lang != null) data['lang'] = lang;
    return data;
  }
}
