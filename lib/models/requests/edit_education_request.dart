class EditEducationRequest {
  late String apiToken;
  int? degreeLevelId;
  late String degreeTitle;
  late String degreeType;
  late String endYear;
  late String startYear;
  late String grad;
  late String university;

  EditEducationRequest({
    required this.apiToken,
    required this.degreeLevelId,
    required this.degreeTitle,
    required this.degreeType,
    required this.endYear,
    required this.grad,
    required this.startYear,
    required this.university,
  });

  EditEducationRequest.fromJson(Map<String, dynamic> json) {
    apiToken = json['apiToken'];
    if (degreeLevelId != null) degreeLevelId = json['degree_level_id'];
    if (degreeTitle != "") degreeTitle = json['degree_title'];
    if (degreeType != "") degreeType = json['degree_type'];
    if (endYear != "") endYear = json['endyear'];
    if (startYear != "") startYear = json['startyear'];
    if (grad != "") grad = json['grad'];
    if (university != "") university = json['university'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apiToken'] = apiToken;
    if (degreeLevelId != null) {
      data['degree_level_id'] = degreeLevelId.toString();
    }
    if (degreeTitle != "") data['degree_title'] = degreeTitle;
    if (university != "") data['university'] = university;
    if (startYear != "") data['startyear'] = startYear;
    if (endYear != "") data['endyear'] = endYear;
    if (grad != "") data['grad'] = grad;
    if (degreeType != "") data['degree_type'] = degreeType;
    return data;
  }
}
