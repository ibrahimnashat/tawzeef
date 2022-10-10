import 'package:tawzeef/models/objects/notification_model.dart';

class GetOfficerNotificationsResponse {
  int? status;
  String? message;
  List<NotificactionModel>? notifications;

  GetOfficerNotificationsResponse(
      {this.status, this.message, this.notifications});

  GetOfficerNotificationsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['Notification'] != null) {
      notifications = <NotificactionModel>[];
      json['Notification'].forEach((v) {
        notifications!.add(NotificactionModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (notifications != null) {
      data['Notification'] = notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
