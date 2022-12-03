import 'industry_model.dart';

class JobCompanyModel {
  String? name;
  IndustryModel? industry;
  String? logo;
  int? id;

  JobCompanyModel({this.name, this.industry, this.logo, this.id});

  JobCompanyModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    industry = json['industry'] != null
        ? IndustryModel.fromJson(json['industry'])
        : null;
    logo = json['logo'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (industry != null) {
      data['industry'] = industry!.toJson();
    }
    data['logo'] = logo;
    data['id'] = id;
    return data;
  }
}
