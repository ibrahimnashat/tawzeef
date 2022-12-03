import 'package:tawzeef/shared/consts/exports.dart';

class GetUsersOfJobServices {
  final Api<GetUsersOfJobResponse, GetUsersOfJobRequest> _api = Api();

  Future<void> getUsersOfJob({
    required String apiToken,
    required int jobId,
    String? status,
    required BuildContext context,
    required Function(GetUsersOfJobResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    _api.post(
      endpoint: urls.usersApplyMyJob,
      toJson: (json) => json.toJson(),
      fromJson: (json) => GetUsersOfJobResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: GetUsersOfJobRequest(
        apiToken: apiToken,
        jobId: jobId,
        status: status,
      ),
    );
  }
}
