import 'package:tawzeef/shared/consts/exports.dart';

class CompanyOrPharmacySearchResponse {
  int? status;
  String? message;
  List<UserModel>? users;

  CompanyOrPharmacySearchResponse({this.status, this.message, this.users});

  CompanyOrPharmacySearchResponse.fromJson(Map<String, dynamic> json) {
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
