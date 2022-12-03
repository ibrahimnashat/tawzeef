import 'package:tawzeef/shared/consts/exports.dart';

class ViewJobServices {
  final Api<ViewJobResponse, ViewJobRequest> _api = Api();

  Future<void> viewJob({
    required int jobId,
    required Function(ViewJobResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.viewJob,
      toJson: (json) => json.toJson(),
      fromJson: (json) => ViewJobResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: ViewJobRequest(
        jobId: jobId,
      ),
    );
  }
}
