import 'package:tawzeef/shared/consts/exports.dart';

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
