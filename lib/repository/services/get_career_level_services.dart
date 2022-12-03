import 'package:tawzeef/shared/consts/exports.dart';

class GetCareerLevelServices {
  final Api<GetCareerLevelResponse, GetCareerLevelRequest> _api = Api();

  Future<void> getCareerLevels({
    required String apiToken,
    required Function(GetCareerLevelResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.careerLevel,
      toJson: (json) => json.toJson(),
      fromJson: (json) => GetCareerLevelResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: GetCareerLevelRequest(apiToken: apiToken),
    );
  }
}
