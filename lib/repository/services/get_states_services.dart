import 'package:tawzeef/shared/consts/exports.dart';

class GetStatesServices {
  final Api<GetStatesResponse, GetStatesRequest> _api = Api();

  Future<void> getStates({
    required int countryId,
    required String apiToken,
    required BuildContext context,
    required Function(GetStatesResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.getStates,
      toJson: (json) => json.toJson(),
      fromJson: (json) => GetStatesResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: GetStatesRequest(countryId: countryId, apiToken: apiToken),
    );
  }
}
