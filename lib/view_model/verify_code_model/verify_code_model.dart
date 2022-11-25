import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/objects/user_model.dart';
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
            if (loginType.userType == UserType.pharmacist) {
              _onPharmacistTypeOpen(context, localSavingData.logUser);
            } else {
              _onPharmacyOrCompanyTypeOpen(context, localSavingData.logUser);
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
        EditCompanyScreen(
          afterEditation: () =>
              context.pushAndRemoveUntil(const CompanyHomeScreen()),
        ),
      );
    } else {
      context.push(const CompanyHomeScreen());
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
              context.pushAndRemoveUntil(const OfficerHomeScreen()),
        ),
      );
    } else {
      context.push(const OfficerHomeScreen());
    }
  }
}
