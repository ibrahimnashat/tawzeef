class GetCountriesRequest {
  late String apiToken;
  GetCountriesRequest({
    required this.apiToken,
  });

  GetCountriesRequest.fromJson(Map<String, dynamic> json) {
    apiToken = json['apiToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apiToken'] = apiToken.toString();
    return data;
  }
}
