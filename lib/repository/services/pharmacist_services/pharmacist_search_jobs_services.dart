import 'package:tawzeef/shared/consts/exports.dart';

class PharmacistSearchJobsServices {
  final Api<PharmacistSearchResponse, PharmacistSearchRequest> _api = Api();

  Future<void> searchJobs({
    int? cityId,
    int? countryId,
    int? jobtitleId,
    int? stateId,
    required String apiToken,
    required Function(PharmacistSearchResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.search,
      toJson: (json) => json.toJson(),
      fromJson: (json) => PharmacistSearchResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: PharmacistSearchRequest(
        cityId: cityId,
        countryId: countryId,
        jobtitleId: jobtitleId,
        stateId: stateId,
        apiToken: apiToken,
      ),
    );
  }
}
