import 'package:tawzeef/shared/consts/exports.dart';
import 'package:tawzeef/repository/services/register_services.dart';

class RegisterScreenModel extends ChangeNotifier {
  final password = TextEditingController();
  final email = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();
  final _registerServices = RegisterServices();
  void register(BuildContext context) async {
    if (email.text.isEmpty) {
      Toast.showOnError(context, context.localization?.pleaseEnterEmail);
    } else if (password.text.isEmpty) {
      Toast.showOnError(context, context.localization?.pleaseEnterPassword);
    } else if (name.text.isEmpty) {
      Toast.showOnError(context, context.localization?.pleaseEnterName);
    } else if (phone.text.isEmpty) {
      Toast.showOnError(context, context.localization?.pleaseEnterPhone);
    } else if (password.text.length < 6) {
      Toast.showOnError(
          context, context.localization?.pleaseEnterPasswordLargeThan6);
    } else if (email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        name.text.isNotEmpty &&
        phone.text.isNotEmpty) {
      Loader.show(context: context);
      _registerServices.register(
        context: context,
        email: email.text,
        name: name.text,
        phone: phone.text,
        password: password.text,
        fCMToken: await fCMNotification.getFCMToken(),
        lang: localStorage.language,
        onSeccuss: (res, message) async {
          Loader.dismiss(context);
          context.pushReplacement(VerifyCodeScreen());
          Toast.showOnSuccessfully(context, message);
          await localStorage.loggedUser(res.user!.toJson());
          await localStorage.storeUserType(loginType.userType);
        },
        onError: (status, message) {
          Loader.dismiss(context);
          Toast.showOnError(context, message);
        },
      );
    }
  }
}
