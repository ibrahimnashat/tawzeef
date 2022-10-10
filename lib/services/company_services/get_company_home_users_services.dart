import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/company_home_request.dart';
import 'package:tawzeef/models/responses/company_home_response.dart';

import '../api.dart';

class GetCompanyHomeUsersServices {
  final Api<CompanyHomeResponse, CompanyHomeRequest> _api = Api();

  Future<void> homeUsers({
    required String apiToken,
    required int page,
    required BuildContext context,
    required Function(CompanyHomeResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    _api.post(
      endpoint: urls.home,
      toJson: (json) => json.toJson(),
      fromJson: (json) => CompanyHomeResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: CompanyHomeRequest(
        page: page,
        apiToken: apiToken,
      ),
    );
  }
}
