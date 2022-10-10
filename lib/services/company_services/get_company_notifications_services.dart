import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/get_company_notifciations_request.dart';
import 'package:tawzeef/models/responses/get_company_notifications_response.dart';

import '../api.dart';

class GetCompanyNotificationsServices {
  final Api<GetCompanyNotificationsResponse, GetCompanyNotificationsRequest>
      _api = Api();

  Future<void> getCompnayNotifications({
    required String apiToken,
    required Function(GetCompanyNotificationsResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.getCompnayNotifications,
      toJson: (json) => json.toJson(),
      fromJson: (json) => GetCompanyNotificationsResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: GetCompanyNotificationsRequest(
        apiToken: apiToken,
      ),
    );
  }
}
