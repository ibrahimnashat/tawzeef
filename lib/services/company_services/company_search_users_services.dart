import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/company_search_request.dart';
import 'package:tawzeef/models/responses/company_search_response.dart';
import 'package:tawzeef/services/api.dart';

class CompanySearchUsersServices {
  final Api<CompanySearchResponse, CompanySearchRequest> _api = Api();

  Future<void> searchJobs({
    required String apiToken,
    int? cityId,
    int? countryId,
    int? stateId,
    required BuildContext context,
    required Function(CompanySearchResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    _api.post(
      endpoint: urls.search,
      toJson: (json) => json.toJson(),
      fromJson: (json) => CompanySearchResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: CompanySearchRequest(
        cityId: cityId,
        countryId: countryId,
        stateId: stateId,
        apiToken: apiToken,
      ),
    );
  }
}
