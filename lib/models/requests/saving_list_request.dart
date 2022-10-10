class SavingListRequest {
  late String? apiToken;

  SavingListRequest({required this.apiToken});

  SavingListRequest.fromJson(Map<String, dynamic> json) {
    apiToken = json['apiToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apiToken'] = apiToken;
    return data;
  }
}
