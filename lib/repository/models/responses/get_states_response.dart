import 'package:tawzeef/shared/consts/exports.dart';

class GetStatesResponse {
  int? status;
  String? message;
  List<StateModel>? state;

  GetStatesResponse({this.status, this.message, this.state});

  GetStatesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['State'] != null) {
      state = <StateModel>[];
      json['State'].forEach((v) {
        state!.add(StateModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (state != null) {
      data['State'] = state!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
