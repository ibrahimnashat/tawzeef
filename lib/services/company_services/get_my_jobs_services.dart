import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/get_my_jobs_request.dart';
import 'package:tawzeef/models/responses/get_my_job_list_response.dart';
import 'package:tawzeef/services/api.dart';

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
