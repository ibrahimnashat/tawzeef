import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/get_job_degree_levels_request.dart';
import 'package:tawzeef/models/responses/get_degree_levels_response.dart';

import 'api.dart';

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
