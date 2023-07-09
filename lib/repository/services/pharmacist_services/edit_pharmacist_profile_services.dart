import 'package:tawzeef/shared/consts/exports.dart';

class EditPharmacistProfileServices {
  final Api<EditPharmacistProfileResponse, EditOfficerProfileRequest> _api =
      Api();

  Future<void> editProfile({
    required String apiToken,
    int? cityId,
    int? countryId,
    File? cv,
    File? img,
    required String dateOfBirth,
    required String email,
    required String name,
    required String phone,
    int? stateId,
    required BuildContext context,
    required Function(EditPharmacistProfileResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.postWithFiles(
      endpoint: urls.editProfile,
      toJson: (json) => json.toJson(),
      fromJson: (json) => EditPharmacistProfileResponse.fromJson(json),
      onError: onError,
      onSuccess: onSeccuss,
      request: EditOfficerProfileRequest(
        apiToken: apiToken,
        cityId: cityId,
        countryId: countryId,
        cv: cv,
        img: img,
        dateOfBirth: dateOfBirth,
        email: email,
        name: name,
        phone: phone,
        stateId: stateId,
      ),
    );
  }
}
