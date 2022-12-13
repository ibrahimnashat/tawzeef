import 'package:tawzeef/shared/consts/exports.dart';
import 'package:tawzeef/languages/localizations.dart';

SettingsScreenModel settings = SettingsScreenModel._private();

class SettingsScreenModel extends ChangeNotifier {
  List options = [];
  Map inital = {};
  final changeLanguageServices = ChangeLanguageServices();
  late Locale locale = Locale(localStorage.language);
  late SpecificLocalizationsDelegate delegate =
      SpecificLocalizationsDelegate(locale);

  Future<void> changeLanguage(
      {required BuildContext context, required String lang}) async {
    Loader.show(context: context);
    await changeLanguageServices.changeLanguage(
      apiToken: localStorage.logUser.apiToken ?? '',
      type: loginType.userType.index == 0 ? 'company' : 'user',
      lang: lang,
      onSeccuss: (res, message) => _onChangeLangaugeSeccuss(context, lang),
      onError: (status, error) {
        Loader.dismiss(context);
        Toast.showOnError(context, error);
      },
    );
  }

  void _onChangeLangaugeSeccuss(BuildContext context, String lang) {
    Loader.dismiss(context);
    locale = Locale(lang);
    delegate = SpecificLocalizationsDelegate(locale);
    if (loginType.userType == UserType.pharmacist) {
      context.pushAndRemoveUntil(const PharmacistHomeScreen());
    } else {
      context.pushAndRemoveUntil(const CompanyOrPharmacyHomeScreen());
    }
    localStorage.storeLanguage(lang);
    notifyListeners();
  }

  void chooseLanguage({required BuildContext context, required String lang}) {
    locale = Locale(lang);
    delegate = SpecificLocalizationsDelegate(locale);
    localStorage.storeLanguage(lang);
    notifyListeners();
  }

  void loading(BuildContext context) {
    options = [
      {'name': context.localization?.english, 'value': 'en'},
      {'name': context.localization?.arabic, 'value': 'ar'},
    ];
    inital = options
        .firstWhere((element) => element['value'] == locale.languageCode);
  }

  SettingsScreenModel._private();
}
