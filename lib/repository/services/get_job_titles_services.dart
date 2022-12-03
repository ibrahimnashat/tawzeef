import 'package:tawzeef/shared/consts/exports.dart';

class GetJobTitlesServices {
  final Api<JopTitleListResponse, JobTitleListRequest> _api = Api();

  Future<void> getJobTitles({
    required String apiToken,
    required Function(JopTitleListResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.jobTitleList,
      toJson: (json) => json.toJson(),
      fromJson: (json) => JopTitleListResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: JobTitleListRequest(apiToken: apiToken),
    );
  }
}
