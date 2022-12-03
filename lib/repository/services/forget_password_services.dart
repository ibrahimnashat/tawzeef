import 'package:tawzeef/shared/consts/exports.dart';

class ForgetPasswordServices {
  final Api<ForgetPasswordResponse, ForgetPasswordRequest> _api = Api();

  Future<void> forgetPassword({
    required String email,
    required BuildContext context,
    required Function(ForgetPasswordResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.forgetPassword,
      toJson: (json) => json.toJson(),
      fromJson: (json) => ForgetPasswordResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: ForgetPasswordRequest(
        email: email,
      ),
    );
  }
}
