import 'package:tawzeef/controller/consts/exports.dart';

class SplashScreenModel extends ChangeNotifier {
  void disposeScreen(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      if (localSavingData.logUser.name != null) {
        if (loginType.userType == UserType.pharmacist) {
          context.pushAndRemoveUntil(const OfficerHomeScreen());
        } else {
          context.pushAndRemoveUntil(const CompanyHomeScreen());
        }
      } else {
        if (localSavingData.chooseLanguageIsOpened) {
          context.pushAndRemoveUntil(const LoginTypeScreen());
        } else {
          context.pushAndRemoveUntil(ChooseLanguageScreen());
        }
      }
    });
  }
}
