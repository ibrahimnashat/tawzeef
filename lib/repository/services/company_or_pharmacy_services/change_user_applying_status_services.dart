import 'package:tawzeef/shared/consts/exports.dart';

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
