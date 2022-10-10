class OfficerSearchRequest {
  int? jobtitleId;
  int? countryId;
  int? stateId;
  int? cityId;
  late String apiToken;

  OfficerSearchRequest({
    this.cityId,
    this.countryId,
    this.jobtitleId,
    this.stateId,
    required this.apiToken,
  });

  OfficerSearchRequest.fromJson(Map<String, dynamic> json) {
    if (jobtitleId != null) jobtitleId = json['jobtitle_id'];
    if (countryId != null) countryId = json['country_id'];
    if (stateId != null) stateId = json['state_id'];
    if (cityId != null) cityId = json['city_id'];
    apiToken = json['apiToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (jobtitleId != null) data['jobtitle_id'] = jobtitleId.toString();
    if (countryId != null) data['country_id'] = countryId.toString();
    if (stateId != null) data['state_id'] = stateId.toString();
    if (cityId != null) data['city_id'] = cityId.toString();
    data['apiToken'] = apiToken;
    return data;
  }
}
