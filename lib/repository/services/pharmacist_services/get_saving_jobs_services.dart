import 'package:tawzeef/shared/consts/exports.dart';

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
