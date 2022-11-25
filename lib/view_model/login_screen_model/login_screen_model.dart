import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/objects/user_model.dart';
import 'package:tawzeef/services/login_services.dart';

class LoginScreenModel extends ChangeNotifier {
  final password = TextEditingController();
  final email = TextEditingController();
  final _loginServices = LoginServices();
  void login(BuildContext context) async {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      Loader.show(context: context);
      _loginServices.login(
        type: loginType.userType.name,
        context: context,
        email: email.text,
        password: password.text,
        fCMToken: await fCMNotification.getFCMToken(),
        lang: localSavingData.language,
        onSeccuss: (res, message) async {
          Loader.dismiss(context);
          final loggedUser = UserModel.fromJson(res.user!.toJson());
          if (loginType.userType == UserType.pharmacist) {
            _onPharmacistTypeOpen(context, loggedUser);
          } else {
            _onPharmacyOrCompanyTypeOpen(context, loggedUser);
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
