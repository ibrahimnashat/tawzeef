import 'package:tawzeef/shared/consts/exports.dart';

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
        lang: localStorage.language,
        onSeccuss: (res, message) async {
          Loader.dismiss(context);
          final loggedUser = UserModel.fromJson(res.user!.toJson());
          if (loginType.userType == UserType.pharmacist) {
            _onPharmacistTypeOpen(context, loggedUser);
          } else {
            _onPharmacyOrCompanyTypeOpen(context, loggedUser);
          }
          Toast.showOnSuccessfully(context, message);
          await localStorage.storeUserType(loginType.userType);
          await localStorage.loggedUser(res.user!.toJson());
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
