import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/change_user_application_status_request.dart';
import 'package:tawzeef/models/responses/change_user_application_status_response.dart';
import 'package:tawzeef/services/api.dart';

class ChangeUserApplyingStatusServices {
  final Api<ChangeUserApplicationStatusResponse,
      ChangeUserApplicationStatusRequest> _api = Api();

  Future<void> changeStatus({
    required String apiToken,
    required int jobId,
    required int userId,
    required BuildContext context,
    String? status,
    required Function(ChangeUserApplicationStatusResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    _api.post(
      endpoint: urls.changeUserApplicationStatus,
      toJson: (json) => json.toJson(),
      fromJson: (json) => ChangeUserApplicationStatusResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: ChangeUserApplicationStatusRequest(
        apiToken: apiToken,
        status: status,
        jobId: jobId,
        userId: userId,
      ),
    );
  }
}
