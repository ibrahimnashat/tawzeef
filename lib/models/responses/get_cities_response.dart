import 'package:tawzeef/models/objects/city_model.dart';

class GetCitiesResponse {
  int? status;
  String? message;
  List<CityModel>? city;

  GetCitiesResponse({this.status, this.message, this.city});

  GetCitiesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['City'] != null) {
      city = <CityModel>[];
      json['City'].forEach((v) {
        city!.add(CityModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (city != null) {
      data['City'] = city!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
