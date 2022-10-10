import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/get_cities_request.dart';
import 'package:tawzeef/models/responses/get_cities_response.dart';

import 'api.dart';

class GetCitiesServices {
  final Api<GetCitiesResponse, GetCitiesRequest> _api = Api();

  Future<void> getCities({
    required String apiToken,
    required int stateId,
    required BuildContext context,
    required Function(GetCitiesResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.getCities,
      toJson: (json) => json.toJson(),
      fromJson: (json) => GetCitiesResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: GetCitiesRequest(
        stateId: stateId,
        apiToken: apiToken,
      ),
    );
  }
}
