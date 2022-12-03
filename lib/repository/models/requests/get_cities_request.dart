class GetCitiesRequest {
  late int stateId;
  late String apiToken;

  GetCitiesRequest({
    required this.stateId,
    required this.apiToken,
  });

  GetCitiesRequest.fromJson(Map<String, dynamic> json) {
    stateId = json['state_id'];
    apiToken = json['apiToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['state_id'] = stateId.toString();
    data['apiToken'] = apiToken;
    return data;
  }
}
