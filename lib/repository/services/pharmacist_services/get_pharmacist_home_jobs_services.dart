import 'package:tawzeef/shared/consts/exports.dart';

class GetPharmacistHomeJobsServices {
  final Api<PharmacistHomeResponse, PharmacistHomeRequest> _api = Api();

  Future<void> homeJobs({
    required int page,
    required String apiToken,
    required BuildContext context,
    required Function(PharmacistHomeResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    _api.post(
      endpoint: urls.home,
      toJson: (json) => json.toJson(),
      fromJson: (json) => PharmacistHomeResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: PharmacistHomeRequest(
        page: page,
        apiToken: apiToken,
      ),
    );
  }
}
