import 'package:tawzeef/controller/consts/exports.dart';

Url urls = Url._private();

class Url {
  //base url
  final String base = "https://chat.cps-eg.net/api/";

  //endpoints

  //---- max urls of company and officer ----
  final String changeLanguage = 'company/changeLang';
  String get register => inCase('/register');
  String get login => inCase('/login');
  String get search => inCase('/search');
  String get home => inCase('/home');
  String get editProfile => inCase('/editProfile');
  String get changePassword => inCase('/changepassword');
  String get validationCode => inCase('/validationCode');
  String get resetPassword => inCase('/resetPassword');
  String get forgetPassword => inCase('/forgetpassword');

  //---- only officer urls ----
  final String getOfficerNotifications = "user/notification";
  final String getOfficerNotificationsCount = "user/countNotification";
  final String editEdicution = "user/editEdicution";
  final String job = "user/job";
  final String jobTitleList = "user/JobTitleList";
  final String applyJob = "user/applyjob";
  final String saveJob = "user/saveJob";
  final String saveingList = "user/SaveingList";
  final String applyList = "user/ApplayList";
  final String viewJob = "user/JobViwe";
  final String getCountries = "user/JobCountry";
  final String getCities = "user/JobCity";
  final String getStates = "user/JobState";
  final String getJobDegreeLevels = "user/jobDegreeLevels";

  //---- only company urls ----
  final String getCompnayNotifications = "company/notification";
  final String getCompanyNotificationsCount = "company/countNotification";
  final String jobShift = "company/JobShift";
  final String jobType = "company/JobType";
  final String careerLevel = "company/CareerLevel";
  final String jobExperience = "company/JobExperience";
  final String addJob = "company/AddJob";
  final String editJob = "company/EditJob";
  final String myJobsList = "company/JobList";
  final String usersApplyMyJob = "company/JobListuser";
  final String changeUserApplicationStatus = "company/changeUserJob";

  String inCase(String endPoint) {
    if (loginType.userType == UserType.pharmacy) return 'company$endPoint';
    return 'user$endPoint';
  }

  Url._private();
}
