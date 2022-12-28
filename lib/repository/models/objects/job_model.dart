import 'package:tawzeef/repository/models/objects/country_model.dart';

import 'career_level_model.dart';
import 'city_model.dart';
import 'job_company_model.dart';
import 'job_experience_model.dart';
import 'job_shift_model.dart';
import 'job_title_model.dart';
import 'job_type_model.dart';
import 'state_model.dart';

class JobModel {
  int? id;
  JobTitleModel? jobTitle;
  JobCompanyModel? jobCompany;
  StateModel? state;
  CityModel? city;
  CountryModel? country;
  String? jobDescription;
  CareerLevelModel? careerLevel;
  double? salary;
  JobTypeModel? jobType;
  JobShiftModel? jobShift;
  JobExperienceModel? jobExperience;
  String? position;
  String? view;
  String? expired;
  String? createdAt;
  String? status;

  JobModel({
    this.id,
    this.jobTitle,
    this.jobCompany,
    this.state,
    this.city,
    this.jobDescription,
    this.careerLevel,
    this.salary,
    this.jobType,
    this.jobShift,
    this.jobExperience,
    this.position,
    this.createdAt,
    this.country,
    this.expired,
    this.status,
    this.view,
  });

  JobModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['statue'];
    jobTitle = json['jobTitle'] != null
        ? JobTitleModel.fromJson(json['jobTitle'])
        : null;
    jobCompany = json['jobCompany'] != null
        ? JobCompanyModel.fromJson(json['jobCompany'])
        : null;
    state = json['state'] != null ? StateModel.fromJson(json['state']) : null;
    city = json['city'] != null ? CityModel.fromJson(json['city']) : null;
    country =
        json['country'] != null ? CountryModel.fromJson(json['country']) : null;
    jobDescription = json['jobDescription'];
    careerLevel = json['careerLevel'] != null
        ? CareerLevelModel.fromJson(json['careerLevel'])
        : null;
    salary = double.tryParse("${json['salary']}");
    jobType =
        json['jobType'] != null ? JobTypeModel.fromJson(json['jobType']) : null;
    jobShift = json['jobShift'] != null
        ? JobShiftModel.fromJson(json['jobShift'])
        : null;
    jobExperience = json['jobExperience'] != null
        ? JobExperienceModel.fromJson(json['jobExperience'])
        : null;
    position = json['position'];
    view = json['viwe'].toString();
    expired = json['expired'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['statue'] = status;
    if (jobTitle != null) {
      data['jobTitle'] = jobTitle!.toJson();
    }
    if (jobCompany != null) {
      data['jobCompany'] = jobCompany!.toJson();
    }
    if (state != null) {
      data['state'] = state!.toJson();
    }
    if (country != null) {
      data['country'] = country!.toJson();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    data['jobDescription'] = jobDescription;
    if (careerLevel != null) {
      data['careerLevel'] = careerLevel!.toJson();
    }
    data['salary'] = salary;
    if (jobType != null) {
      data['jobType'] = jobType!.toJson();
    }
    if (jobShift != null) {
      data['jobShift'] = jobShift!.toJson();
    }
    if (jobExperience != null) {
      data['jobExperience'] = jobExperience!.toJson();
    }
    data['position'] = position;
    data['created_at'] = createdAt;
    data['viwe'] = view;
    data['expired'] = expired;
    return data;
  }
}
