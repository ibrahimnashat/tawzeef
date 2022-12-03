import 'package:tawzeef/shared/consts/exports.dart';

class GetDegreeLevelsServices {
  final Api<GetDegreeLevelsResponse, GetJobDegreeLevelsRequest> _api = Api();

  Future<void> getJobDegreeLevels({
    required String apiToken,
    required BuildContext context,
    required Function(GetDegreeLevelsResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.getJobDegreeLevels,
      toJson: (json) => json.toJson(),
      fromJson: (json) => GetDegreeLevelsResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: GetJobDegreeLevelsRequest(apiToken: apiToken),
    );
  }
}
