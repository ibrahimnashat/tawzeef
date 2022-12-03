class AddJobRequest {
  String? apiToken;
  String? description;
  int? countryId;
  int? stateId;
  int? cityId;
  int? careerLevelId;
  String? jobExpired;
  String? salary;
  int? jobTypeId;
  int? jobShiftId;
  String? numOfPositions;
  int? jobExperienceId;
  int? jobTitleId;

  AddJobRequest({
    this.apiToken = '',
    this.jobTitleId,
    this.description = '',
    this.careerLevelId,
    this.jobExpired = '',
    this.jobExperienceId,
    this.jobTypeId,
    this.salary = '',
    this.jobShiftId,
    this.numOfPositions,
    this.stateId,
    this.cityId,
    this.countryId,
  });

  AddJobRequest.fromJson(Map<String, dynamic> json) {
    apiToken = json['apiToken'];
    if (jobTitleId != null) jobTitleId = json['job_title_id'];
    if (countryId != null) countryId = json['country_id'];
    if (stateId != null) stateId = json['state_id'];
    if (cityId != null) cityId = json['city_id'];
    if (careerLevelId != null) careerLevelId = json['career_level_id'];
    if (jobExpired != "") jobExpired = json['job_expired'];
    if (jobTypeId != null) jobTypeId = json['job_type_id'];
    if (salary != "") salary = json['salary'];
    if (jobShiftId != null) jobShiftId = json['job_shift_id'];
    if (numOfPositions != "") numOfPositions = json['num_of_positions'];
    if (description != "") description = json['description'];
    if (jobExperienceId != null) jobExperienceId = json['job_experience_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apiToken'] = apiToken;
    if (jobTitleId != null) data['job_title_id'] = jobTitleId.toString();
    if (countryId != null) data['country_id'] = countryId.toString();
    if (stateId != null) data['state_id'] = stateId.toString();
    if (cityId != null) data['city_id'] = cityId.toString();
    if (jobExpired != "") data['job_expired'] = jobExpired;
    if (jobTypeId != null) data['job_type_id'] = jobTypeId.toString();
    if (salary != "") data['salary'] = salary;
    if (jobShiftId != null) data['job_shift_id'] = jobShiftId.toString();
    if (numOfPositions != "") data['num_of_positions'] = numOfPositions;
    if (description != "") data['description'] = description;
    if (careerLevelId != null) {
      data['career_level_id'] = careerLevelId.toString();
    }
    if (jobExperienceId != null) {
      data['job_experience'] = jobExperienceId.toString();
    }

    return data;
  }
}
