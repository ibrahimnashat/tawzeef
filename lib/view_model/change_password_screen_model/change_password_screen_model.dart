import 'package:tawzeef/shared/consts/exports.dart';

import 'package:tawzeef/repository/services/change_password_services.dart';

class ChangePasswordScreenModel extends ChangeNotifier {
  final changePasswordServices = ChangePasswordServices();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  Future<void> changePassword(
    BuildContext context,
  ) async {
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
      await changePasswordServices.changePassword(
        password: password.text,
        apiToken: localSavingData.logUser.email!,
        context: context,
        onSeccuss: (res, message) {
          Loader.dismiss(context);
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
