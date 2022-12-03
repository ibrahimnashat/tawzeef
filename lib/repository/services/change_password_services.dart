import 'package:tawzeef/shared/consts/exports.dart';

class ChangePasswordServices {
  final Api<ChangePasswordResponse, ChangePasswordRequest> _api = Api();

  Future<void> changePassword({
    required String apiToken,
    required String password,
    required BuildContext context,
    required Function(ChangePasswordResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.changePassword,
      toJson: (json) => json.toJson(),
      fromJson: (json) => ChangePasswordResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: ChangePasswordRequest(
        password: password,
        apiToken: apiToken,
      ),
    );
  }
}
