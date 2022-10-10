import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/save_job_request.dart';
import 'package:tawzeef/models/responses/save_job_response.dart';
import 'package:tawzeef/services/api.dart';

class SaveJobServices {
  final Api<SaveJobResponse, SaveJobRequest> _api = Api();

  Future<void> saveJob({
    String? apiToken,
    required int jobId,
    required BuildContext context,
    required Function(SaveJobResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.saveJob,
      toJson: (json) => json.toJson(),
      fromJson: (json) => SaveJobResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: SaveJobRequest(
        apiToken: apiToken,
        jobId: jobId,
      ),
    );
  }
}
