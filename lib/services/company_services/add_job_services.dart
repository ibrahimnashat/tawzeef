import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/add_job_request.dart';
import 'package:tawzeef/models/responses/add_job_response.dart';
import 'package:tawzeef/services/api.dart';

class AddJobServices {
  final Api<AddJobResponse, AddJobRequest> _api = Api();

  Future<void> addJob({
    required String apiToken,
    int? careerLevelId,
    String? description,
    int? jobExperienceId,
    String? jobExpired,
    int? jobShiftId,
    int? jobTitleId,
    int? jobTypeId,
    String? numOfPositions,
    String? salary,
    int? cityId,
    int? countryId,
    int? stateId,
    required BuildContext context,
    required Function(AddJobResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    _api.post(
      endpoint: urls.addJob,
      toJson: (json) => json.toJson(),
      fromJson: (json) => AddJobResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: AddJobRequest(
        cityId: cityId,
        countryId: countryId,
        stateId: stateId,
        apiToken: apiToken,
        careerLevelId: careerLevelId,
        description: description,
        jobExperienceId: jobExperienceId,
        jobExpired: jobExpired,
        jobShiftId: jobShiftId,
        jobTitleId: jobTitleId,
        jobTypeId: jobTypeId,
        numOfPositions: numOfPositions,
        salary: salary,
      ),
    );
  }
}
