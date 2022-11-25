import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/login_request.dart';
import 'package:tawzeef/models/responses/login_response.dart';

import 'api.dart';

class LoginServices {
  final Api<LoginResponse, LoginRequest> _api = Api();

  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
    String? fCMToken,
    String? lang,
    String? type,
    required Function(LoginResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    _api.post(
      endpoint: urls.login,
      toJson: (json) => json.toJson(),
      fromJson: (json) => LoginResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: LoginRequest(
        type: type,
        email: email,
        password: password,
        fCMToken: fCMToken,
        lang: lang,
      ),
    );
  }
}
