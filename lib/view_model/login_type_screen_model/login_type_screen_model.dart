import 'package:tawzeef/controller/consts/exports.dart';

enum UserType { company, officer }

LoginTypeScreenModel loginType = LoginTypeScreenModel._private();

class LoginTypeScreenModel {
  late UserType userType;

  void setOfficerUserType(BuildContext context) {
    userType = UserType.officer;
    _openLogin(context);
  }

  void setCompanyUserType(BuildContext context) {
    userType = UserType.company;
    _openLogin(context);
  }

  void _openLogin(BuildContext context) {
    context.push(LoginScreen());
  }

  LoginTypeScreenModel._private();
}
