import 'package:tawzeef/shared/consts/exports.dart';

class VerifyCodeServices {
  final Api<VerifyCodeResponse, VerifyCodeRequest> _api = Api();

  Future<void> verifyCode({
    String? email,
    String? apiToken,
    required String code,
    required BuildContext context,
    required Function(VerifyCodeResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.validationCode,
      toJson: (json) => json.toJson(),
      fromJson: (json) => VerifyCodeResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: VerifyCodeRequest(
        code: code,
        email: email,
        apiToken: apiToken,
      ),
    );
  }
}
