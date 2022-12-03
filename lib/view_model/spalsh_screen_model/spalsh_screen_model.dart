import 'package:tawzeef/shared/consts/exports.dart';

class SplashScreenModel extends ChangeNotifier {
  void disposeScreen(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      if (localStorage.logUser.name != null) {
        if (loginType.userType == UserType.pharmacist) {
          context.pushAndRemoveUntil(const PharmacistHomeScreen());
        } else {
          context.pushAndRemoveUntil(const CompanyOrPharmacyHomeScreen());
        }
      } else {
        if (localStorage.chooseLanguageIsOpened) {
          context.pushAndRemoveUntil(const LoginTypeScreen());
        } else {
          context.pushAndRemoveUntil(ChooseLanguageScreen());
        }
      }
    });
  }
}
