class CompanyHomeRequest {
  late int page;
  late String apiToken;

  CompanyHomeRequest({
    required this.page,
    required this.apiToken,
  });

  CompanyHomeRequest.fromJson(Map<String, dynamic> json) {
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
