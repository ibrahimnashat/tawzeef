import 'package:tawzeef/shared/consts/exports.dart';

class GetDegreeLevelsResponse {
  int? status;
  String? message;
  List<DegreeLevelModel>? degreeLevels;

  GetDegreeLevelsResponse({this.status, this.message, this.degreeLevels});

  GetDegreeLevelsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['State'] != null) {
      degreeLevels = <DegreeLevelModel>[];
      json['State'].forEach((v) {
        degreeLevels!.add(DegreeLevelModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (degreeLevels != null) {
      data['State'] = degreeLevels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
