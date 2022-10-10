import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/requests/edit_education_request.dart';
import 'package:tawzeef/models/responses/edit_education_response.dart';
import 'package:tawzeef/services/api.dart';

class EditEducationServices {
  final Api<EditEducationResponse, EditEducationRequest> _api = Api();

  Future<void> editEdicution({
    required String apiToken,
    int? degreeLevelId,
    required String degreeTitle,
    required String degreeType,
    required String endYear,
    required String grad,
    required String startYear,
    required String university,
    required BuildContext context,
    required Function(EditEducationResponse, String) onSeccuss,
    required Function(int, String) onError,
  }) async {
    await _api.post(
      endpoint: urls.editEdicution,
      toJson: (json) => json.toJson(),
      fromJson: (json) => EditEducationResponse.fromJson(json),
      onError: onError,
      onSeccuss: onSeccuss,
      request: EditEducationRequest(
        apiToken: apiToken,
        degreeLevelId: degreeLevelId,
        degreeTitle: degreeTitle,
        degreeType: degreeType,
        endYear: endYear,
        grad: grad,
        startYear: startYear,
        university: university,
      ),
    );
  }
}
