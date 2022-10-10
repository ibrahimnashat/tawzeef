import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/get_countries_request.dart';
import 'package:tawzeef/models/responses/get_countries_response.dart';

import 'api.dart';

class GetCountriesServices {
  final Api<GetCountriesResponse, GetCountriesRequest> _api = Api();

  Future<void> getCountries({
    required String apiToken,
    required BuildContext context,
    required Function(GetCountriesResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.getCountries,
      toJson: (json) => json.toJson(),
      fromJson: (json) => GetCountriesResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: GetCountriesRequest(apiToken: apiToken),
    );
  }
}
