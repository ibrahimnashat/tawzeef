import 'package:tawzeef/shared/consts/exports.dart';

class JobCompanyModel {
  int? id;
  String? name;
  IndustryModel? industry;
  String? logo;
  CountryModel? country;
  StateModel? state;
  CityModel? city;
  String? description;
  String? facebook;
  String? linkedin;
  String? twitter;
  String? website;
  String? noOfEmployees;

  JobCompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    noOfEmployees = json['no_of_employees'];
    industry = json['industry'] != null
        ? IndustryModel.fromJson(json['industry'])
        : null;
    city = json['city'] != null ? CityModel.fromJson(json['city']) : null;
    state = json['state'] != null ? StateModel.fromJson(json['state']) : null;
    country =
        json['country'] != null ? CountryModel.fromJson(json['country']) : null;
    logo = json['logo'];
    description = json['description'];
    facebook = json['facebook'];
    linkedin = json['linkedin'];
    twitter = json['twitter'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (industry != null) {
      data['industry'] = industry!.toJson();
    }
    if (country != null) {
      data['country'] = country!.toJson();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (state != null) {
      data['state'] = state!.toJson();
    }
    data['no_of_employees'] = noOfEmployees;
    data['logo'] = logo;
    data['description'] = description;
    data['facebook'] = facebook;
    data['linkedin'] = linkedin;
    data['twitter'] = twitter;
    data['id'] = id;
    return data;
  }
}
