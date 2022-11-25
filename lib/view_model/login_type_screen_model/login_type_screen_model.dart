import 'package:tawzeef/controller/consts/exports.dart';

enum UserType { pharmacy, pharmacist, company }

LoginTypeScreenModel loginType = LoginTypeScreenModel._private();

class LoginTypeScreenModel {
  late UserType userType;

  void setPharmacistUserType(BuildContext context) {
    userType = UserType.pharmacist;
    _openLogin(context);
  }

  void setCompanyUserType(BuildContext context) {
    userType = UserType.company;
    _openLogin(context);
  }

  void setPharmacyUserType(BuildContext context) {
    userType = UserType.pharmacy;
    _openLogin(context);
  }

  void _openLogin(BuildContext context) {
    context.push(LoginScreen());
  }

  LoginTypeScreenModel._private();
}
