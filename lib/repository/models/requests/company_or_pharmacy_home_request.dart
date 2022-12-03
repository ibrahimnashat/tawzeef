class CompanyOrPharmacyHomeRequest {
  late int page;
  late String apiToken;

  CompanyOrPharmacyHomeRequest({
    required this.page,
    required this.apiToken,
  });

  CompanyOrPharmacyHomeRequest.fromJson(Map<String, dynamic> json) {
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
