import 'package:tawzeef/shared/consts/exports.dart';

class EditOfficerProfileRequest {
  late String apiToken;
  late String email;
  late String phone;
  late String name;
  int? countryId;
  int? stateId;
  int? cityId;
  late String dateOfBirth;
  File? cv;
  File? img;

  EditOfficerProfileRequest({
    required this.apiToken,
    this.cityId,
    this.countryId,
    this.cv,
    required this.dateOfBirth,
    required this.email,
    this.img,
    required this.name,
    required this.phone,
    this.stateId,
  });

  EditOfficerProfileRequest.fromJson(Map<String, dynamic> json) {
    apiToken = json['apiToken'];
    if (countryId != null) countryId = json['country_id'];
    if (stateId != null) stateId = json['state_id'];
    if (cityId != null) cityId = json['city_id'];
    if (dateOfBirth != "") dateOfBirth = json['date_of_birth'];
    if (email != "") email = json['email'];
    if (img != null) img = json['img'];
    if (cv != null) cv = json['cv'];
    if (name != "") name = json['name'];
    if (phone != "") phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apiToken'] = apiToken;
    if (countryId != null) data['country_id'] = countryId.toString();
    if (stateId != null) data['state_id'] = stateId.toString();
    if (cityId != null) data['city_id'] = cityId.toString();
    if (dateOfBirth != "") {
      data['date_of_birth'] = dateOfBirth;
    }
    if (phone != "") data['phone'] = phone;
    if (email != "") data['email'] = email;
    if (name != "") data['name'] = name;
    if (cv != null) data['cv'] = cv;
    if (img != null) data['img'] = img;

    return data;
  }
}
