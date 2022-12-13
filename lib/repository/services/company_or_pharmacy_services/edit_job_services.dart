import 'package:tawzeef/shared/consts/exports.dart';

class EditJobServices {
  final Api<EditJobResponse, EditJobRequest> _api = Api();

  Future<void> editJob({
    required String apiToken,
    //  int? careerLevelId,
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
    int? jobId,
    required BuildContext context,
    required Function(EditJobResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    _api.post(
      endpoint: urls.editJob,
      toJson: (json) => json.toJson(),
      fromJson: (json) => EditJobResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: EditJobRequest(
        cityId: cityId,
        countryId: countryId,
        stateId: stateId,
        apiToken: apiToken,
        // careerLevelId: careerLevelId,
        description: description,
        jobExperienceId: jobExperienceId,
        jobExpired: jobExpired,
        jobShiftId: jobShiftId,
        jobTitleId: jobTitleId,
        jobTypeId: jobTypeId,
        numOfPositions: numOfPositions,
        salary: salary,
        jobId: jobId,
      ),
    );
  }
}
