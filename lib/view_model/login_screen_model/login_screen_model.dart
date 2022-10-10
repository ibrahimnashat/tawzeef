import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/services/login_services.dart';

class LoginScreenModel extends ChangeNotifier {
  final password = TextEditingController();
  final email = TextEditingController();
  final _loginServices = LoginServices();
  void login(BuildContext context) async {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      Loader.show(context: context);
      _loginServices.login(
        context: context,
        email: email.text,
        password: password.text,
        fCMToken: await fCMNotification.getFCMToken(),
        lang: localSavingData.language,
        onSeccuss: (res, message) async {
          Loader.dismiss(context);
          if (loginType.userType == UserType.company) {
            context.push(const CompanyHomeScreen());
          } else if (loginType.userType == UserType.officer) {
            context.push(const OfficerHomeScreen());
          }
          Toast.showOnSuccessfully(context, message);
          await localSavingData.storeUserType(loginType.userType);
          await localSavingData.loggedUser(res.user!.toJson());
        },
        onError: (status, message) {
          Loader.dismiss(context);
          Toast.showOnError(context, message);
        },
      );
    } else if (email.text.isEmpty) {
      Toast.showOnError(context, context.localization?.pleaseEnterEmail);
    } else if (password.text.isEmpty) {
      Toast.showOnError(context, context.localization?.pleaseEnterPassword);
    }
  }
}
