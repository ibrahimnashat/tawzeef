import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/get_job_types_request.dart';
import 'package:tawzeef/models/responses/get_job_types_response.dart';

import 'api.dart';

class GetJobTypesServices {
  final Api<GetJobTypesResponse, GetJobTypesRequest> _api = Api();

  Future<void> jobTypes({
    required String apiToken,
    required Function(GetJobTypesResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.jobType,
      toJson: (json) => json.toJson(),
      fromJson: (json) => GetJobTypesResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: GetJobTypesRequest(apiToken: apiToken),
    );
  }
}
