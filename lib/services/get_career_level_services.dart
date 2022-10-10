import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/get_career_level_request.dart';
import 'package:tawzeef/models/responses/get_career_level_response.dart';

import 'api.dart';

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
