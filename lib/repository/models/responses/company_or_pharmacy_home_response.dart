import 'package:tawzeef/shared/consts/exports.dart';

class CompanyOrPharmacyHomeResponse {
  int? status;
  String? message;
  List<UserModel>? users;
  List<AdModel>? ads;

  CompanyOrPharmacyHomeResponse({this.status, this.message, this.users});

  CompanyOrPharmacyHomeResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['users'] != null) {
      users = <UserModel>[];
      json['users'].forEach((v) {
        users!.add(UserModel.fromJson(v));
      });
    }
    if (json['ads'] != null) {
      ads = <AdModel>[];
      json['ads'].forEach((v) {
        ads!.add(AdModel.fromJson(v));
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
    if (ads != null) {
      data['ads'] = ads!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
