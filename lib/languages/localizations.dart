import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'messages_all.dart';

class AppLocalizations {
  String get signUp => Intl.message("Sign Up", name: "signUp");
  String get continuue => Intl.message("Continue", name: "continuue");
  String get verifcationCode =>
      Intl.message("Verification Code", name: "verifcationCode");
  String get name => Intl.message("Name", name: "name");
  String get email => Intl.message("Email", name: "email");
  String get phone => Intl.message("Phone Number", name: "phone");
  String get password => Intl.message("Password", name: "password");
  String get getStarted => Intl.message("GET STARTED", name: "getStarted");
  String get login => Intl.message("Log In", name: "login");
  String get haveAnAcount =>
      Intl.message("Have an Account?", name: "haveAnAcount");

  String get resetPassword =>
      Intl.message("Reset password", name: "resetPassword");
  String get newPassword => Intl.message("New Password", name: "newPassword");
  String get confirmPassword =>
      Intl.message("Confirm Password", name: "confirmPassword");
  String get confirmEmail =>
      Intl.message("Confirm your e-mail", name: "confirmEmail");
  String get needHelp => Intl.message("Need help?", name: "needHelp");
  String get forgetPassword =>
      Intl.message("Forget Password", name: "forgetPassword");
  String get newable =>
      Intl.message("Do not have an account?", name: "newable");
  String get createAccount =>
      Intl.message("Create Account", name: "createAccount");
  String get pharmacist => Intl.message("Pharmacist", name: "pharmacist");

  String get pharmacy => Intl.message('Pharmacy', name: "pharmacy");
  String get changePassword =>
      Intl.message("Change Password", name: "changePassword");
  String get save => Intl.message("Save", name: "save");
  String get hi => Intl.message('Hi', name: "hi");
  String get welcomeBack => Intl.message("Welcome Back", name: "welcomeBack");
  String get home => Intl.message("Home", name: "home");
  String get myProfile => Intl.message("My profile", name: "myProfile");
  String get notifications =>
      Intl.message("Notifications", name: "notifications");
  String get myApplications =>
      Intl.message("My applications", name: "myApplications");

  String get saved => Intl.message("Saved", name: "saved");
  String get settings => Intl.message("Settings", name: "settings");
  String get logOut => Intl.message("LogOut", name: "logOut");
  String get followUs => Intl.message('Follow Us', name: "followUs");
  String get dateOfBirth => Intl.message("Date of birth", name: "dateOfBirth");
  String get country => Intl.message("Country", name: "country");
  String get state => Intl.message("State", name: "state");
  String get city => Intl.message("City", name: "city");
  String get yourCV => Intl.message("Your CV", name: "yourCV");
  String get updateCV => Intl.message("Update CV", name: "updateCV");

  String get education => Intl.message("Education", name: "education");
  String get university => Intl.message("University", name: "university");
  String get jobType => Intl.message("Jop Type", name: "jobType");
  String get degreeLevel => Intl.message("Degree Level", name: "degreeLevel");
  String get filedOfStudy =>
      Intl.message("Field of study", name: "filedOfStudy");
  String get startYear => Intl.message("Start Year", name: "startYear");
  String get endYear => Intl.message("End Year", name: "endYear");
  String get grad => Intl.message("Grad", name: "grad");
  String get welcome => Intl.message('Welcome , ', name: "welcome");
  String get searchJob => Intl.message("Search Job", name: "searchJob");
  String get location => Intl.message("Location", name: "location");
  String get apply => Intl.message("Apply", name: "apply");
  String get jobDetails => Intl.message("Job detail", name: "jobDetails");

  String get appliedForThisJob =>
      Intl.message("Applied for this job", name: "appliedForThisJob");
  String get careerLevel => Intl.message('Career Level', name: "careerLevel");
  String get yearOfExperience =>
      Intl.message('Year Of Experience', name: "yearOfExperience");
  String get jobShift => Intl.message('Job Shift', name: "jobShift");
  String get numberOfOfficer =>
      Intl.message('Number Of Officer', name: "numberOfOfficer");
  String get cancelApplying =>
      Intl.message("Cancel Applying", name: "cancelApplying");
  String get applyNow => Intl.message("Apply Now", name: "applyNow");

  String get chooseLanguage =>
      Intl.message("Choose Language", name: "changeLanguage");

  String get choosePreferredLanguage =>
      Intl.message("Please choose your preferred language",
          name: "choosePreferredLanguage");

  String get arabic => Intl.message('Arabic', name: "arabic");
  String get english => Intl.message('English', name: "english");
  String get addJob => Intl.message("Add Job", name: "addJob");
  String get myJob => Intl.message("My Job", name: "myJob");
  String get editJob => Intl.message("Edit Job", name: "editJob");
  String get myCompany => Intl.message("My Company", name: "myCompany");

  String get searchPharmacist =>
      Intl.message("Search Pharmacist", name: "searchPharmacist");
  String get companyName => Intl.message("Company name", name: "companyName");
  String get noOfEmployees =>
      Intl.message('Number Of Employees', name: "noOfEmployees");
  String get addLinks => Intl.message("Add Link", name: "addLinks");
  String get website => Intl.message("Website link", name: "website");
  String get facebook => Intl.message("Facebook link", name: "facebook");
  String get linkedin => Intl.message("LinkedIn link", name: "linkedin");
  String get twitter => Intl.message("Twitter link", name: "twitter");
  String get jobName => Intl.message('Job Name', name: "jobName");
  String get salary => Intl.message('Salary', name: "salary");
  String get jobExperience =>
      Intl.message('Job Experience', name: "jobExperience");
  String get jobExpired => Intl.message('Job Expired', name: "jobExpired");
  String get jobApplicants =>
      Intl.message("Job Applicants", name: "jobApplicants");
  String get allRequests => Intl.message("All Request", name: "allRequests");
  String get reject => Intl.message("Reject", name: "reject");
  String get inReview => Intl.message("In Review", name: "inReview");
  String get views => Intl.message("Views", name: "views");
  String get jobTitle => Intl.message('Job Title', name: "jobTitle");
  String get aboutCompany =>
      Intl.message("About Company", name: "aboutCompany");
  String get socialMedia => Intl.message("Social Media", name: "socialMedia");

  String get pleaseEnterPassword =>
      Intl.message("Please enter password", name: "pleaseEnterPassword");
  String get pleaseEnterConfrimPassword =>
      Intl.message("Please enter confirm password",
          name: "pleaseEnterConfrimPassword");
  String get pleaseEnterSamePassword =>
      Intl.message("Please enter same password",
          name: "pleaseEnterSamePassword");
  String get pleaseEnterPasswordLargeThan6 =>
      Intl.message("Password is short than 6 characters",
          name: "pleaseEnterPasswordLargeThan6");
  String get pleaseCompleteYourData =>
      Intl.message("Please complete your data", name: "pleaseCompleteYourData");
  String get pleaseEnterDataToChange =>
      Intl.message("Please enter change data to update",
          name: "pleaseEnterDataToChange");
  String get pleaseEnterEmail =>
      Intl.message("Please enter your email", name: "pleaseEnterEmail");
  String get pleaseEnterName =>
      Intl.message("Please enter name", name: "pleaseEnterName");
  String get pleaseEnterPhone =>
      Intl.message("Please enter phone", name: "pleaseEnterPhone");
  String get pleaseEnterVerifyCode =>
      Intl.message("Please enter verify code", name: "pleaseEnterVerifyCode");
  String get company => Intl.message('Company', name: "company");
  String get jobStatus =>
      Intl.message("Cann't apply for this job again", name: "jobStatus");
  String get linkCannotOpen =>
      Intl.message("Cann't open this link", name: "linkCannotOpen");

  String get openCv => Intl.message("Open CV", name: "openCv");

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Future<AppLocalizations> load(Locale locale) {
    final name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then(
      (_) {
        Intl.defaultLocale = localeName;
        return AppLocalizations();
      },
    );
  }
}

class SpecificLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  final Locale? overriddenLocale;

  SpecificLocalizationsDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => overriddenLocale != null;

  @override
  Future<AppLocalizations> load(Locale locale) =>
      AppLocalizations.load(overriddenLocale!);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => true;
}
