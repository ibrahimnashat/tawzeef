import 'package:tawzeef/shared/consts/exports.dart';

class ChangeLanguageServices {
  final Api<ChangeLanguageResponse, ChangeLanguageRequest> _api = Api();

  Future<void> changeLanguage({
    required String apiToken,
    required String type,
    required String lang,
    required Function(ChangeLanguageResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.changeLanguage,
      toJson: (json) => json.toJson(),
      fromJson: (json) => ChangeLanguageResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: ChangeLanguageRequest(
        apiToken: apiToken,
        lang: lang,
        type: type,
      ),
    );
  }
}
