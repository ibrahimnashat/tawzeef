import 'package:tawzeef/shared/consts/exports.dart';

class GetCompanyOrPharmacyNotificationsCountServices {
  final Api<GetCompanyOrPharmacyNotificationsCountResponse,
      GetCompanyOrPharmacyNotificationsCountRequest> _api = Api();

  Future<void> getCompanyNotificationsCount({
    required String apiToken,
    required Function(GetCompanyOrPharmacyNotificationsCountResponse, String)
        onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.getCompanyNotificationsCount,
      toJson: (json) => json.toJson(),
      fromJson: (json) =>
          GetCompanyOrPharmacyNotificationsCountResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: GetCompanyOrPharmacyNotificationsCountRequest(
        apiToken: apiToken,
      ),
    );
  }
}
