import 'package:tawzeef/shared/consts/exports.dart';

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
