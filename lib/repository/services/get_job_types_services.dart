import 'package:tawzeef/shared/consts/exports.dart';

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
