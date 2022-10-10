import 'degree_level_model.dart';

class ProfileEducationModel {
  DegreeLevelModel? degreeLevel;
  String? degreeTitle;
  String? endYear;
  String? startYear;
  String? grad;
  String? university;
  String? degreeType;

  ProfileEducationModel({
    this.degreeLevel,
    this.degreeTitle,
    this.degreeType,
    this.endYear,
    this.grad,
    this.startYear,
    this.university,
  });

  ProfileEducationModel.fromJson(Map<String, dynamic> json) {
    degreeLevel = json['degree_level'] != null
        ? DegreeLevelModel.fromJson(json['degree_level'])
        : null;
    degreeTitle = json['degree_title'];
    endYear = json['endyear'];

    startYear = json['startyear'];
    grad = json['grad'];
    university = json['university'];
    degreeType = json['degree_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (degreeLevel != null) {
      data['degree_level'] = degreeLevel!.toJson();
    }
    data['degree_title'] = degreeTitle;
    data['endyear'] = endYear;

    data['startyear'] = startYear;
    data['grad'] = grad;
    data['university'] = university;
    data['degree_type'] = degreeType;
    return data;
  }
}
