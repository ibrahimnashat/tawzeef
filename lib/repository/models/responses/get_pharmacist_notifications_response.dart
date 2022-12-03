import 'package:tawzeef/repository/models/objects/notification_model.dart';

class GetPharmacistNotificationsResponse {
  int? status;
  String? message;
  List<NotificactionModel>? notifications;

  GetPharmacistNotificationsResponse(
      {this.status, this.message, this.notifications});

  GetPharmacistNotificationsResponse.fromJson(Map<String, dynamic> json) {
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
