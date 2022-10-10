import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/applying_list_request.dart';
import 'package:tawzeef/models/responses/applying_list_response.dart';

import '../api.dart';

class GetApplyingJobsServices {
  final Api<ApplingListResponse, ApplingListRequest> _api = Api();

  Future<void> getApplyingJobs({
    String? apiToken,
    required BuildContext context,
    required Function(ApplingListResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.applyList,
      toJson: (json) => json.toJson(),
      fromJson: (json) => ApplingListResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: ApplingListRequest(
        apiToken: apiToken,
      ),
    );
  }
}
