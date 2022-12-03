import 'package:tawzeef/shared/consts/exports.dart';

LocalSavingDataModel localSavingData = LocalSavingDataModel._private();

class LocalSavingDataModel extends ChangeNotifier {
  late UserModel logUser;
  String get language => _get('lang') == '' ? 'en' : _get('lang');
  bool get chooseLanguageIsOpened =>
      _get('choose-lang') == 'opened' ? true : false;

  late SharedPreferences prefs;
  Future<void> getPref() async {
    prefs = await SharedPreferences.getInstance();
    await _afterPrefAsync();
  }

  void storeLanguage(lang) {
    _store(lang, 'lang');
  }

  void chooseLanguageOpened() {
    _store('opened', 'choose-lang');
  }

  Future<void> storeUserType(UserType userType) async {
    await _store(userType.name, 'userType');
  }

  Future<void> loggedUser(Map<String, dynamic> data) async {
    debuggerPrint(data);
    await _storeObject(data, 'logUser');
    logUser = UserModel.fromJson(data);
    notifyListeners();
  }

  String _get(String key) {
    return prefs.getString(key) ?? '';
  }

  Future<void> _store(String data, String key) async {
    await prefs.setString(key, data);
  }

  Map<String, dynamic> _getObject(String key) {
    return jsonDecode(prefs.getString(key) ?? '{}');
  }

  Future<void> _storeObject(Map<String, dynamic> data, String key) async {
    await prefs.setString(key, jsonEncode(data));
  }

  Future<void> _afterPrefAsync() async {
    try {
      logUser = UserModel.fromJson(_getObject('logUser'));
      loginType.userType = UserType.pharmacist.name == _get('userType')
          ? UserType.pharmacist
          : UserType.pharmacy;
    } catch (e) {
      debuggerPrint(e);
    }
  }

  Future<void> logOut(BuildContext context) async {
    context.pushAndRemoveUntil(const LoginTypeScreen());
    await loggedUser({});
  }

  void debuggerPrint(Object object) {
    debugPrint(object.toString());
  }

  LocalSavingDataModel._private() {
    getPref();
  }
}
