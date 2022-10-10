import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/apply_job_request.dart';
import 'package:tawzeef/models/responses/apply_job_response.dart';
import 'package:tawzeef/services/api.dart';

class ApplyJobServices {
  final Api<ApplyJobResponse, ApplyJobRequest> _api = Api();

  Future<void> applyJob({
    String? apiToken,
    required int jobId,
    required BuildContext context,
    required Function(ApplyJobResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.applyJob,
      toJson: (json) => json.toJson(),
      fromJson: (json) => ApplyJobResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: ApplyJobRequest(
        apiToken: apiToken,
        jobId: jobId,
      ),
    );
  }
}
