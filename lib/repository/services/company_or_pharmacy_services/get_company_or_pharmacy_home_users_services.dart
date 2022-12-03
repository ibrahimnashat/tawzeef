import 'package:tawzeef/shared/consts/exports.dart';

class GetCompanyOrPharmacyHomeUsersServices {
  final Api<CompanyOrPharmacyHomeResponse, CompanyOrPharmacyHomeRequest> _api =
      Api();

  Future<void> homeUsers({
    required String apiToken,
    required int page,
    required BuildContext context,
    required Function(CompanyOrPharmacyHomeResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    _api.post(
      endpoint: urls.home,
      toJson: (json) => json.toJson(),
      fromJson: (json) => CompanyOrPharmacyHomeResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: CompanyOrPharmacyHomeRequest(
        page: page,
        apiToken: apiToken,
      ),
    );
  }
}
