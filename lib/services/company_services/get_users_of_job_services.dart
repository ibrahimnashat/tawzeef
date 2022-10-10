import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/get_users_of_job_request.dart';
import 'package:tawzeef/models/responses/get_users_of_job_response.dart';
import 'package:tawzeef/services/api.dart';

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
