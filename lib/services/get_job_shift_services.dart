import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/get_job_shift_request.dart';
import 'package:tawzeef/models/responses/get_job_shift_response.dart';

import 'api.dart';

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
