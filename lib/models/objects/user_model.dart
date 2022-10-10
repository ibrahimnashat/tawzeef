import 'city_model.dart';
import 'country_model.dart';
import 'profile_education_model.dart';
import 'state_model.dart';

import 'package:tawzeef/controller/consts/exports.dart';

class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? apiToken;
  String? dateOfBirth;
  CountryModel? country;
  StateModel? state;
  CityModel? city;
  String? image;
  String? cv;
  String? noOfEmployees;
  String? description;
  List<ProfileEducationModel>? profileEducation;
  String? facebook;
  String? linkedin;
  String? twitter;
  String? website;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.apiToken,
    this.dateOfBirth,
    this.country,
    this.state,
    this.city,
    this.image,
    this.cv,
    this.profileEducation,
    this.noOfEmployees,
    this.description,
    this.facebook,
    this.linkedin,
    this.twitter,
    this.website,
    this.id,
  });

  ProfileEducationModel? get education {
    try {
      return profileEducation![0];
    } catch (e) {
      return null;
    }
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    facebook = json['facebook'];
    linkedin = json['linkedin'];
    twitter = json['twitter'];
    website = json['website'];
    description = json['description'];
    noOfEmployees = json['no_of_employees'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    apiToken = json['apiToken'];
    if (json['dateOfBirth'] != null) {
      dateOfBirth = DateTime.tryParse(json['dateOfBirth'])!.dateOnly;
    }
    if (json['country'] != null) {
      country = CountryModel.fromJson(json['country']);
    }
    if (json['state'] != null) state = StateModel.fromJson(json['state']);
    if (json['city'] != null) city = CityModel.fromJson(json['city']);
    if (json['image'] != null) image = json['image'];
    if (json['cv'] != null) cv = json['cv'];
    if (json['profileEducation'] != null) {
      profileEducation = <ProfileEducationModel>[];
      json['profileEducation'].forEach((v) {
        profileEducation!.add(ProfileEducationModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['facebook'] = facebook;
    data['id'] = id;
    data['linkedin'] = linkedin;
    data['twitter'] = twitter;
    data['website'] = website;
    data['description'] = description;
    data['no_of_employees'] = noOfEmployees;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['apiToken'] = apiToken;
    data['dateOfBirth'] = dateOfBirth;
    data['country'] = country?.toJson();
    data['state'] = state?.toJson();
    data['city'] = city?.toJson();
    data['image'] = image;
    data['cv'] = cv;
    if (profileEducation != null) {
      data['profileEducation'] =
          profileEducation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
