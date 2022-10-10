import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/get_company_notifciations_count_request.dart';
import 'package:tawzeef/models/responses/get_company_notifications_count_response.dart';

import '../api.dart';

class GetCompanyNotificationsCountServices {
  final Api<GetCompanyNotificationsCountResponse,
      GetCompanyNotificationsCountRequest> _api = Api();

  Future<void> getCompanyNotificationsCount({
    required String apiToken,
    required Function(GetCompanyNotificationsCountResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.getCompanyNotificationsCount,
      toJson: (json) => json.toJson(),
      fromJson: (json) => GetCompanyNotificationsCountResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: GetCompanyNotificationsCountRequest(
        apiToken: apiToken,
      ),
    );
  }
}
