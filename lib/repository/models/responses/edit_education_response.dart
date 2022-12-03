import 'package:tawzeef/shared/consts/exports.dart';

class EditEducationResponse {
  int? status;
  String? message;
  UserModel? user;

  EditEducationResponse({this.status, this.message, this.user});

  EditEducationResponse.fromJson(Map<String, dynamic> json) {
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
