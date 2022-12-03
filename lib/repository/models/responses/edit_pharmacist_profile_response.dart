import 'package:tawzeef/repository/models/objects/user_model.dart';

class EditPharmacistProfileResponse {
  int? status;
  String? message;
  UserModel? user;

  EditPharmacistProfileResponse({this.status, this.message, this.user});

  EditPharmacistProfileResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}