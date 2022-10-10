class OfficerHomeRequest {
  late int page;
  late String apiToken;

  OfficerHomeRequest({
    required this.page,
    required this.apiToken,
  });

  OfficerHomeRequest.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    apiToken = json['apiToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page.toString();
    data['apiToken'] = apiToken;
    return data;
  }
}
