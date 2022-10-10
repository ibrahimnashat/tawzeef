import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/saving_list_request.dart';
import 'package:tawzeef/models/responses/saving_list_response.dart';
import 'package:tawzeef/services/api.dart';

class GetSavingJobsServices {
  final Api<SavingListResponse, SavingListRequest> _api = Api();

  Future<void> getSaveingJobs({
    String? apiToken,
    required BuildContext context,
    required Function(SavingListResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.saveingList,
      toJson: (json) => json.toJson(),
      fromJson: (json) => SavingListResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: SavingListRequest(
        apiToken: apiToken,
      ),
    );
  }
}
