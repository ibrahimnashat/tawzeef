class PharmacistHomeRequest {
  late int page;
  late String apiToken;

  PharmacistHomeRequest({
    required this.page,
    required this.apiToken,
  });

  PharmacistHomeRequest.fromJson(Map<String, dynamic> json) {
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
