import 'package:tawzeef/shared/consts/exports.dart';

import 'package:tawzeef/repository/services/reset_password_services.dart';

class ResetPasswordScreenModel extends ChangeNotifier {
  final resetPasswordServices = ResetPasswordServices();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  void setHidePasswordType() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  void setHideConfirmPasswordType() {
    hideConfirmPassword = !hideConfirmPassword;
    notifyListeners();
  }

  Future<void> resetPassword(
      {required BuildContext context, required String apiToken}) async {
    if (password.text.isEmpty) {
      Toast.showOnError(context, context.localization?.pleaseEnterPassword);
    } else if (confirmPassword.text.isEmpty) {
      Toast.showOnError(
          context, context.localization?.pleaseEnterConfrimPassword);
    } else if (password.text != confirmPassword.text) {
      Toast.showOnError(context, context.localization?.pleaseEnterSamePassword);
    } else if (password.text == confirmPassword.text &&
        password.text.length < 6) {
      Toast.showOnError(
          context, context.localization?.pleaseEnterPasswordLargeThan6);
    } else if (password.text == confirmPassword.text) {
      Loader.show(context: context);
      await resetPasswordServices.resetPassword(
        password: password.text,
        apiToken: apiToken,
        context: context,
        onSeccuss: (res, message) {
          Loader.dismiss(context);
          context.pushAndRemoveUntil(LoginScreen());
          Toast.showOnSuccessfully(context, message);
        },
        onError: (status, error) {
          Loader.dismiss(context);
          Toast.showOnError(context, error);
        },
      );
    }
  }
}
