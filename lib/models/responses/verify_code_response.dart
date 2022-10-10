class VerifyCodeResponse {
  int? status;
  String? message;
  String? apiToken;
  VerifyCodeResponse({this.status, this.message});

  VerifyCodeResponse.fromJson(Map<String, dynamic> json) {
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
