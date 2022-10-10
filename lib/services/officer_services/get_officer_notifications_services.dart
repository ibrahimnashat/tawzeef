import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/get_officer_notifciations_request.dart';
import 'package:tawzeef/models/responses/get_officer_notifications_response.dart';

import '../api.dart';

class GetOfficerNotificationsServices {
  final Api<GetOfficerNotificationsResponse, GetOfficerNotificationsRequest>
      _api = Api();

  Future<void> getOfficerNotifications({
    required String apiToken,
    required Function(GetOfficerNotificationsResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.getOfficerNotifications,
      toJson: (json) => json.toJson(),
      fromJson: (json) => GetOfficerNotificationsResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: GetOfficerNotificationsRequest(
        apiToken: apiToken,
      ),
    );
  }
}
