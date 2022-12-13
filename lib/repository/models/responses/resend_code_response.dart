class ResendCodeResponse {
  int? status;
  String? message;
  String? apiToken;
  ResendCodeResponse({this.status, this.message});

  ResendCodeResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    apiToken = json['apiToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['apiToken'] = apiToken;
    return data;
  }
}
