import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/view_job_request.dart';
import 'package:tawzeef/models/responses/view_job_response.dart';
import 'package:tawzeef/services/api.dart';

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
