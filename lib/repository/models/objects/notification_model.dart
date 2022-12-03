import 'package:tawzeef/repository/models/objects/job_model.dart';
import 'package:tawzeef/repository/models/objects/user_model.dart';

class NotificactionModel {
  JobModel? job;
  UserModel? user;
  String? message;
  int? isRead;
  String? title;
  int? id;

  NotificactionModel({
    this.job,
    this.id,
    this.isRead,
    this.message,
    this.title,
    this.user,
  });

  NotificactionModel.fromJson(Map<String, dynamic> json) {
    job = json['job'] != null ? JobModel.fromJson(json['job']) : null;
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    id = json['id'];
    isRead = json['is_read'];
    message = json['message'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (job != null) {
      data['job'] = job!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['id'] = id;
    data['isRead'] = isRead;
    data['message'] = message;
    data['title'] = title;
    return data;
  }
}
