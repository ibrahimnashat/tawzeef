import 'package:tawzeef/shared/consts/exports.dart';

class ResetPasswordServices {
  final Api<ResetPasswordResponse, ResetPasswordRequest> _api = Api();

  Future<void> resetPassword({
    required String apiToken,
    required String password,
    required BuildContext context,
    required Function(ResetPasswordResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.changePassword,
      toJson: (json) => json.toJson(),
      fromJson: (json) => ResetPasswordResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: ResetPasswordRequest(
        password: password,
        apiToken: apiToken,
      ),
    );
  }
}
