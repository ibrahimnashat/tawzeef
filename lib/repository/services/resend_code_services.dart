import 'package:tawzeef/repository/models/requests/resend_code_request.dart';
import 'package:tawzeef/repository/models/responses/resend_code_response.dart';
import 'package:tawzeef/shared/consts/exports.dart';

class ResendCodeServices {
  final Api<ResendCodeResponse, ResendCodeRequest> _api = Api();

  Future<void> verifyCode({
    String? fcmToken,
    String? apiToken,
    required BuildContext context,
    required Function(ResendCodeResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.companyResendCode,
      toJson: (json) => json.toJson(),
      fromJson: (json) => ResendCodeResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: ResendCodeRequest(
        apiToken: apiToken,
        fcmToken: fcmToken,
      ),
    );
  }
}
