import 'package:tawzeef/shared/consts/exports.dart';

class GetMyJobsServices {
  final Api<GetMyJobListResponse, GetMyJobsRequest> _api = Api();

  Future<void> getMyJobs({
    required String apiToken,
    required Function(GetMyJobListResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    _api.post(
      endpoint: urls.myJobsList,
      toJson: (json) => json.toJson(),
      fromJson: (json) => GetMyJobListResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: GetMyJobsRequest(apiToken: apiToken),
    );
  }
}
