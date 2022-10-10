class GetStatesRequest {
  late int countryId;
  late String apiToken;

  GetStatesRequest({
    required this.countryId,
    required this.apiToken,
  });

  GetStatesRequest.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    apiToken = json['apiToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country_id'] = countryId.toString();
    data['apiToken'] = apiToken;
    return data;
  }
}
