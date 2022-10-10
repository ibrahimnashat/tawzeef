import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/register_request.dart';
import 'package:tawzeef/models/responses/register_response.dart';

import 'api.dart';

class RegisterServices {
  final Api<RegisterResponse, RegisterRequest> _api = Api();

  Future<void> register({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
    required String phone,
    String? fCMToken,
    String? lang,
    required Function(RegisterResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    _api.post(
      endpoint: urls.register,
      toJson: (json) => json.toJson(),
      fromJson: (json) => RegisterResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: RegisterRequest(
        name: name,
        phone: phone,
        email: email,
        password: password,
        fCMToken: fCMToken,
        lang: lang,
      ),
    );
  }
}
