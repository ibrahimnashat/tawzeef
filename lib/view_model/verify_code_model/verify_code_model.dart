import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/services/verify_code_services.dart';

class VerifyCodeScreenModel extends ChangeNotifier {
  String _code = '';
  final verifyCodeServices = VerifyCodeServices();

  void setCode(String value) {
    _code = value;
  }

  Future<void> verifyCode(
    BuildContext context,
    String? email,
  ) async {
    if (_code == "") {
      Toast.showOnError(context, context.localization?.pleaseEnterVerifyCode);
    } else {
      Loader.show(context: context);
      await verifyCodeServices.verifyCode(
        code: _code,
        apiToken: localSavingData.logUser.apiToken,
        email: email,
        context: context,
        onSeccuss: (res, message) {
          Loader.dismiss(context);
          if (res.apiToken != null) {
            context.pushReplacement(
              ResetPasswordScreen(
                apiToken: res.apiToken!,
              ),
            );
          } else {
            if (loginType.userType == UserType.company) {
              context.push(const CompanyHomeScreen());
            } else if (loginType.userType == UserType.officer) {
              context.push(const OfficerHomeScreen());
            }
          }
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
