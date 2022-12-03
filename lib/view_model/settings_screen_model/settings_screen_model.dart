import 'package:tawzeef/shared/consts/exports.dart';
import 'package:tawzeef/languages/localizations.dart';
import 'package:tawzeef/repository/services/change_language_services.dart';

SettingsScreenModel settings = SettingsScreenModel._private();

class SettingsScreenModel extends ChangeNotifier {
  List options = [];
  Map inital = {};
  late Locale locale = Locale(localSavingData.language);
  late SpecificLocalizationsDelegate delegate =
      SpecificLocalizationsDelegate(locale);
  final changeLanguageServices = ChangeLanguageServices();

  Future<void> changeLanguage(
      {required BuildContext context, required String lang}) async {
    Loader.show(context: context);
    await changeLanguageServices.changeLanguage(
      apiToken: localSavingData.logUser.apiToken ?? '',
      type: loginType.userType.index == 0 ? 'company' : 'user',
      lang: lang,
      onSeccuss: (res, message) {
        Loader.dismiss(context);
        locale = Locale(lang);
        delegate = SpecificLocalizationsDelegate(locale);
        if (loginType.userType == UserType.pharmacist) {
          context.pushAndRemoveUntil(const PharmacistHomeScreen());
        } else {
          context.pushAndRemoveUntil(const CompanyOrPharmacyHomeScreen());
        }
        localSavingData.storeLanguage(lang);
        notifyListeners();
      },
      onError: (status, error) {
        Loader.dismiss(context);
        Toast.showOnError(context, error);
      },
    );
  }

  void chooseLanguage({required BuildContext context, required String lang}) {
    locale = Locale(lang);
    delegate = SpecificLocalizationsDelegate(locale);
    context.pushAndRemoveUntil(const LoginTypeScreen());
    localSavingData.storeLanguage(lang);
    notifyListeners();
  }

  void loading(BuildContext context) {
    options = [
      {'name': context.localization?.english ?? '', 'value': 'en'},
      {'name': context.localization?.arabic ?? '', 'value': 'ar'},
    ];
    inital = options
        .firstWhere((element) => element['value'] == locale.languageCode);
  }

  SettingsScreenModel._private();
}
