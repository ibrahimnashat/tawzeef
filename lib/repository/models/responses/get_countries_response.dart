import 'package:tawzeef/repository/models/objects/country_model.dart';

class GetCountriesResponse {
  int? status;
  String? message;
  List<CountryModel>? country;

  GetCountriesResponse({this.status, this.message, this.country});

  GetCountriesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['Country'] != null) {
      country = <CountryModel>[];
      json['Country'].forEach((v) {
        country!.add(CountryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (country != null) {
      data['Country'] = country!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
