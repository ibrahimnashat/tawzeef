import 'package:tawzeef/shared/consts/exports.dart';

class GetJobServices {
  final Api<JopResponse, JobRequest> _api = Api();

  Future<void> getJob({
    required int jobId,
    required String apiToken,
    required Function(JopResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.job,
      toJson: (json) => json.toJson(),
      fromJson: (json) => JopResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: JobRequest(
        apiToken: apiToken,
        jobId: jobId,
      ),
    );
  }
}
