import 'package:tawzeef/shared/consts/exports.dart';

class GetJobShiftServices {
  final Api<GetJobShiftResponse, GetJobShiftRequest> _api = Api();

  Future<void> jobShifts({
    required String apiToken,
    required Function(GetJobShiftResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.jobShift,
      toJson: (json) => json.toJson(),
      fromJson: (json) => GetJobShiftResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: GetJobShiftRequest(apiToken: apiToken),
    );
  }
}
