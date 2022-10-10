import 'package:tawzeef/models/objects/user_model.dart';

class GetUsersOfJobResponse {
  int? status;
  String? message;
  List<UserModel>? users;

  GetUsersOfJobResponse({this.status, this.message, this.users});

  GetUsersOfJobResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['job'] != null) {
      users = <UserModel>[];
      json['job'].forEach((v) {
        users!.add(UserModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (users != null) {
      data['job'] = users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
