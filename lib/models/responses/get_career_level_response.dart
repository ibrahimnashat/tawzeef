import 'package:tawzeef/models/objects/career_level_model.dart';

class GetCareerLevelResponse {
  int? status;
  String? message;
  List<CareerLevelModel>? careerLevels;

  GetCareerLevelResponse({this.status, this.message, this.careerLevels});

  GetCareerLevelResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['job'] != null) {
      careerLevels = <CareerLevelModel>[];
      json['job'].forEach((v) {
        careerLevels!.add(CareerLevelModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (careerLevels != null) {
      data['job'] = careerLevels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
