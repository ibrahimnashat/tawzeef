import 'package:tawzeef/shared/consts/exports.dart';

class SplashScreenModel extends ChangeNotifier {
  void disposeScreen(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      if (localStorage.logUser.name != null &&
          localStorage.logUser.verified == 1) {
        if (loginType.userType == UserType.pharmacist) {
          context.pushReplacement(const PharmacistHomeScreen());
        } else {
          context.pushReplacement(const CompanyOrPharmacyHomeScreen());
        }
      } else if (localStorage.logUser.verified == 0) {
        context.pushReplacement(VerifyCodeScreen());
      } else {
        context.pushReplacement(LoginTypeScreen());
      }
    });
  }
}
