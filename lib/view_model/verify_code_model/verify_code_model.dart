import 'package:tawzeef/shared/consts/exports.dart';

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
        apiToken: localStorage.logUser.apiToken,
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
            if (loginType.userType == UserType.pharmacist) {
              _onPharmacistTypeOpen(context, localStorage.logUser);
            } else {
              _onPharmacyOrCompanyTypeOpen(context, localStorage.logUser);
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

  void _onPharmacyOrCompanyTypeOpen(
      BuildContext context, UserModel loggedUser) {
    if (loggedUser.image == null ||
        loggedUser.city == null ||
        loggedUser.country == null ||
        loggedUser.description == null ||
        loggedUser.noOfEmployees == null) {
      context.push(
        EditCompanyOrPharmacyScreen(
          afterEditation: () =>
              context.pushAndRemoveUntil(const CompanyOrPharmacyHomeScreen()),
        ),
      );
    } else {
      context.push(const CompanyOrPharmacyHomeScreen());
    }
  }

  void _onPharmacistTypeOpen(BuildContext context, UserModel loggedUser) {
    if (loggedUser.image == null ||
        loggedUser.city == null ||
        loggedUser.country == null ||
        loggedUser.education == null ||
        loggedUser.cv == null) {
      context.push(
        EditProfileScreen(
          afterEditation: () =>
              context.pushAndRemoveUntil(const PharmacistHomeScreen()),
        ),
      );
    } else {
      context.push(const PharmacistHomeScreen());
    }
  }
}
