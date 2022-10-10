import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/officer_search_request.dart';
import 'package:tawzeef/models/responses/officer_search_response.dart';
import 'package:tawzeef/services/api.dart';

class OfficerSearchJobsServices {
  final Api<OfficerSearchResponse, OfficerSearchRequest> _api = Api();

  Future<void> searchJobs({
    int? cityId,
    int? countryId,
    int? jobtitleId,
    int? stateId,
    required String apiToken,
    required BuildContext context,
    required Function(OfficerSearchResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    _api.post(
      endpoint: urls.search,
      toJson: (json) => json.toJson(),
      fromJson: (json) => OfficerSearchResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: OfficerSearchRequest(
        cityId: cityId,
        countryId: countryId,
        jobtitleId: jobtitleId,
        stateId: stateId,
        apiToken: apiToken,
      ),
    );
  }
}
