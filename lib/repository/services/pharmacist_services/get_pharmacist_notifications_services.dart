import 'package:tawzeef/shared/consts/exports.dart';

class GetPharmacistNotificationsServices {
  final Api<GetPharmacistNotificationsResponse,
      GetPharmacistNotificationsRequest> _api = Api();

  Future<void> getOfficerNotifications({
    required String apiToken,
    required Function(GetPharmacistNotificationsResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.getOfficerNotifications,
      toJson: (json) => json.toJson(),
      fromJson: (json) => GetPharmacistNotificationsResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: GetPharmacistNotificationsRequest(
        apiToken: apiToken,
      ),
    );
  }
}
