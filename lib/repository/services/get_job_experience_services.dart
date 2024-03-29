import 'package:tawzeef/shared/consts/exports.dart';

class GetJobExperienceServices {
  final Api<GetJobExperienceResponse, GetJobExperienceRequest> _api = Api();

  Future<void> getJobExperience({
    required String apiToken,
    required Function(GetJobExperienceResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.jobExperience,
      toJson: (json) => json.toJson(),
      fromJson: (json) => GetJobExperienceResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: GetJobExperienceRequest(apiToken: apiToken),
    );
  }
}
