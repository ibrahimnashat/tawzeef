import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/officer_home_request.dart';
import 'package:tawzeef/models/responses/officer_home_response.dart';
import 'package:tawzeef/services/api.dart';

class GetOfficerHomeJobsServices {
  final Api<OfficerHomeResponse, OfficerHomeRequest> _api = Api();

  Future<void> homeJobs({
    required int page,
    required String apiToken,
    required BuildContext context,
    required Function(OfficerHomeResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    _api.post(
      endpoint: urls.home,
      toJson: (json) => json.toJson(),
      fromJson: (json) => OfficerHomeResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: OfficerHomeRequest(
        page: page,
        apiToken: apiToken,
      ),
    );
  }
}
