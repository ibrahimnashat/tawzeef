import 'package:tawzeef/shared/consts/exports.dart';

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
