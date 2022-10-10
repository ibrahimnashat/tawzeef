import 'dart:io';

import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/edit_officer_profile_request.dart';
import 'package:tawzeef/models/responses/edit_officer_profile_response.dart';
import 'package:tawzeef/services/api.dart';

class EditOfficerProfileServices {
  final Api<EditOfficerProfileResponse, EditOfficerProfileRequest> _api = Api();

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
    required Function(EditOfficerProfileResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.postWithFiles(
      endpoint: urls.editProfile,
      toJson: (json) => json.toJson(),
      fromJson: (json) => EditOfficerProfileResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
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
