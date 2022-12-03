import 'package:tawzeef/shared/consts/exports.dart';

class GetCompanyOrPharmacyNotificationsServices {
  final Api<GetCompanyOrPharmacyNotificationsResponse,
      GetCompanyOrPharmacyNotificationsRequest> _api = Api();

  Future<void> getCompnayNotifications({
    required String apiToken,
    required Function(GetCompanyOrPharmacyNotificationsResponse, String)
        onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.getCompnayNotifications,
      toJson: (json) => json.toJson(),
      fromJson: (json) =>
          GetCompanyOrPharmacyNotificationsResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: GetCompanyOrPharmacyNotificationsRequest(
        apiToken: apiToken,
      ),
    );
  }
}
