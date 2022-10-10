import 'dart:io';

import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/edit_company_profile_request.dart';
import 'package:tawzeef/models/responses/edit_company_profile_response.dart';
import 'package:tawzeef/services/api.dart';

class EditCompanyProfileServices {
  final Api<EditCompanyProfileResponse, EditCompanyProfileRequest> _api = Api();

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
    required Function(EditCompanyProfileResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.postWithFiles(
      endpoint: urls.editProfile,
      toJson: (json) => json.toJson(),
      fromJson: (json) => EditCompanyProfileResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: EditCompanyProfileRequest(
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
