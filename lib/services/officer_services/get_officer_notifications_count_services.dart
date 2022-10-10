import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/get_officer_notifciations_count_request.dart';
import 'package:tawzeef/models/responses/get_officer_notifications_count_response.dart';

import '../api.dart';

class GetOfficerNotificationsCountServices {
  final Api<GetOfficerNotificationsCountResponse,
      GetOfficerNotificationsCountRequest> _api = Api();

  Future<void> getOfficerNotificationsCount({
    required String apiToken,
    required Function(GetOfficerNotificationsCountResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.getOfficerNotificationsCount,
      toJson: (json) => json.toJson(),
      fromJson: (json) => GetOfficerNotificationsCountResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: GetOfficerNotificationsCountRequest(
        apiToken: apiToken,
      ),
    );
  }
}
