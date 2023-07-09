import 'package:tawzeef/shared/consts/exports.dart';
import 'package:tawzeef/repository/services/forget_password_services.dart';

class ForgetPasswordScreenModel extends ChangeNotifier {
  final email = TextEditingController();
  final forgetPasswordServices = ForgetPasswordServices();

  Future<void> forgetPassword(
    BuildContext context,
  ) async {
    if (email.text.isEmpty) {
      Toast.showOnError(context, context.localization?.pleaseEnterEmail);
    } else {
      Loader.show(context: context);
      await forgetPasswordServices.forgetPassword(
        email: email.text,
        context: context,
        onSeccuss: (res, message) {
          Loader.dismiss(context);
          context.pushReplacement(VerifyCodeScreen(email: email.text));
          Toast.showOnSuccessfully(context, message);
        },
        onError: (status, message) {
          Loader.dismiss(context);
          Toast.showOnError(context, message);
        },
      );
    }
  }
}
