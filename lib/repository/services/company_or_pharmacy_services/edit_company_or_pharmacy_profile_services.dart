import 'package:tawzeef/shared/consts/exports.dart';

class EditCompanyOrPharmacyProfileServices {
  final Api<EditCompanyOrPharmacyProfileResponse,
      EditCompanyOrPharmacyProfileRequest> _api = Api();

  Future<void> editProfile({
    required String apiToken,
    int? cityId,
    int? countryId,
    File? img,
    String? email,
    String? name,
    String? phone,
    String? description,
    String? noOfEmployees,
    String? facebook,
    String? linkedin,
    String? twitter,
    String? website,
    int? stateId,
    required BuildContext context,
    required Function(EditCompanyOrPharmacyProfileResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.postWithFiles(
      endpoint: urls.editProfile,
      toJson: (json) => json.toJson(),
      fromJson: (json) => EditCompanyOrPharmacyProfileResponse.fromJson(json),
      onError: onError,
      onSuccess: onSeccuss,
      request: EditCompanyOrPharmacyProfileRequest(
        apiToken: apiToken,
        cityId: cityId,
        countryId: countryId,
        img: img,
        email: email,
        name: name,
        phone: phone,
        stateId: stateId,
        description: description,
        noOfEmployees: noOfEmployees,
        facebook: facebook,
        linkedin: linkedin,
        twitter: twitter,
        website: website,
      ),
    );
  }
}
