import 'package:tawzeef/shared/consts/exports.dart';

class CompanyOrPharmacySearchUsersServices {
  final Api<CompanyOrPharmacySearchResponse, CompanyOrPharmacySearchRequest>
      _api = Api();

  Future<void> searchJobs({
    required String apiToken,
    int? cityId,
    int? countryId,
    int? stateId,
    required BuildContext context,
    required Function(CompanyOrPharmacySearchResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    _api.post(
      endpoint: urls.search,
      toJson: (json) => json.toJson(),
      fromJson: (json) => CompanyOrPharmacySearchResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: CompanyOrPharmacySearchRequest(
        cityId: cityId,
        countryId: countryId,
        stateId: stateId,
        apiToken: apiToken,
      ),
    );
  }
}
