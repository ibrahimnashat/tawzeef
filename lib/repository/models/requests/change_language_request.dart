class ChangeLanguageRequest {
  late String apiToken;
  late String type;
  late String lang;
  ChangeLanguageRequest({
    required this.apiToken,
    required this.lang,
    required this.type,
  });

  ChangeLanguageRequest.fromJson(Map<String, dynamic> json) {
    apiToken = json['apiToken'];
    type = json['type'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apiToken'] = apiToken;
    data['type'] = type;
    data['lang'] = lang;
    return data;
  }
}
