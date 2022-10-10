class CompanySearchRequest {
  late String apiToken;
  int? countryId;
  int? stateId;
  int? cityId;

  CompanySearchRequest({
    this.cityId,
    this.countryId,
    this.stateId,
    required this.apiToken,
  });

  CompanySearchRequest.fromJson(Map<String, dynamic> json) {
    apiToken = json['apiToken'];
    if (countryId != null) countryId = json['country_id'];
    if (stateId != null) stateId = json['state_id'];
    if (cityId != null) cityId = json['city_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apiToken'] = apiToken;
    if (countryId != null) data['country_id'] = countryId.toString();
    if (stateId != null) data['state_id'] = stateId.toString();
    if (cityId != null) data['city_id'] = cityId.toString();
    return data;
  }
}
