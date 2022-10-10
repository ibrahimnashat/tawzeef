import 'package:tawzeef/models/objects/user_model.dart';

class CompanySearchResponse {
  int? status;
  String? message;
  List<UserModel>? users;

  CompanySearchResponse({this.status, this.message, this.users});

  CompanySearchResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['users'] != null) {
      users = <UserModel>[];
      json['users'].forEach((v) {
        users!.add(UserModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
