import 'dart:io';

class EditCompanyProfileRequest {
  String? apiToken;
  String? email;
  String? phone;
  String? name;
  String? description;
  String? website;
  String? facebook;
  String? twitter;
  String? linkedin;
  String? noOfEmployees;
  int? countryId;
  int? stateId;
  int? cityId;
  File? img;

  EditCompanyProfileRequest({
    this.apiToken = '',
    this.email = '',
    this.name = '',
    this.phone = '',
    this.description = '',
    this.noOfEmployees = '',
    this.facebook = '',
    this.website = '',
    this.twitter = '',
    this.linkedin = '',
    this.stateId,
    this.cityId,
    this.countryId,
    this.img,
  });

  EditCompanyProfileRequest.fromJson(Map<String, dynamic> json) {
    apiToken = json['apiToken'];
    if (countryId != null) countryId = json['country_id'];
    if (stateId != null) stateId = json['state_id'];
    if (cityId != null) cityId = json['city_id'];
    if (email != "") email = json['email'];
    if (img != null) img = json['img'];
    if (name != "") name = json['name'];
    if (phone != "") phone = json['phone'];
    if (facebook != "") facebook = json['facebook'];
    if (website != "") website = json['website'];
    if (twitter != "") twitter = json['twitter'];
    if (linkedin != "") linkedin = json['linkedin'];
    if (description != "") description = json['description'];
    if (noOfEmployees != "") noOfEmployees = json['no_of_employees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apiToken'] = apiToken;
    if (countryId != null) data['country_id'] = countryId.toString();
    if (stateId != null) data['state_id'] = stateId.toString();
    if (cityId != null) data['city_id'] = cityId.toString();
    if (img != null) data['img'] = img;
    if (phone != "") data['phone'] = phone;
    if (email != "") data['email'] = email;
    if (name != "") data['name'] = name;
    if (facebook != "") data['facebook'] = facebook;
    if (website != "") data['website'] = website;
    if (twitter != "") data['twitter'] = twitter;
    if (linkedin != "") data['linkedin'] = linkedin;
    if (description != "") data['description'] = description;
    if (noOfEmployees != "") {
      data['no_of_employees'] = noOfEmployees;
    }

    return data;
  }
}
