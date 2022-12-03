import 'package:tawzeef/shared/consts/exports.dart';

class GetPharmacistNotificationsCountServices {
  final Api<GetPharmacistNotificationsCountResponse,
      GetPharmacistNotificationsCountRequest> _api = Api();

  Future<void> getOfficerNotificationsCount({
    required String apiToken,
    required Function(GetPharmacistNotificationsCountResponse, String)
        onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.getOfficerNotificationsCount,
      toJson: (json) => json.toJson(),
      fromJson: (json) =>
          GetPharmacistNotificationsCountResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: GetPharmacistNotificationsCountRequest(
        apiToken: apiToken,
      ),
    );
  }
}
