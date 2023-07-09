import 'package:tawzeef/shared/consts/exports.dart';

class EditEducationScreenModel extends ChangeNotifier {
  DegreeLevelModel? degreeLevel;
  ProfileEducationModel? education;
  List<DegreeLevelModel> degreeLevels = [];

  final startYear = TextEditingController();
  final endYear = TextEditingController();
  final jopType = TextEditingController();
  final degreeTitle = TextEditingController();
  final university = TextEditingController();
  final grad = TextEditingController();
  final editEducationServices = EditEducationServices();
  final degreeLevelsServices = GetDegreeLevelsServices();

  EditEducationScreenModel(BuildContext context) {
    _getJobDegreeLevels(context);
    final val = localStorage.logUser.profileEducation;
    if (val!.isNotEmpty) {
      education = val[0];
      if (education != null) degreeLevel = education?.degreeLevel;
    }
  }

  void changeDegreeLevel(DegreeLevelModel res) {
    degreeLevel = res;
  }

  Future<void> editEducation(BuildContext context) async {
    if (startYear.text.isNotEmpty ||
        endYear.text.isNotEmpty ||
        jopType.text.isNotEmpty ||
        degreeTitle.text.isNotEmpty ||
        university.text.isNotEmpty ||
        grad.text.isNotEmpty ||
        degreeLevel != null) {
      Loader.show(context: context);
      await editEducationServices.editEdicution(
        degreeLevelId: degreeLevel?.id,
        degreeTitle: degreeTitle.text,
        degreeType: jopType.text,
        endYear: endYear.text,
        grad: grad.text,
        startYear: startYear.text,
        university: university.text,
        apiToken: localStorage.logUser.apiToken ?? '',
        context: context,
        onSeccuss: (res, message) {
          Loader.dismiss(context);
          context.pop();
          Toast.showOnSuccessfully(context, message);
          if (res.user != null) localStorage.loggedUser(res.user!.toJson());
        },
        onError: (status, error) {
          Toast.showOnError(context, error);
        },
      );
    } else {
      Toast.showOnError(context, context.localization?.pleaseCompleteYourData);
    }
  }

  Future<void> _getJobDegreeLevels(BuildContext context) async {
    await degreeLevelsServices.getJobDegreeLevels(
      apiToken: localStorage.logUser.apiToken ?? '',
      context: context,
      onSeccuss: (res, message) {
        degreeLevels.addAll(res.degreeLevels!);
        notifyListeners();
        Toast.showOnSuccessfully(context, message);
      },
      onError: (status, error) {
        Toast.showOnError(context, error);
      },
    );
  }

  Future<String> showDateTimePicker(BuildContext context) async {
    final value = await showOmniDateTimePicker(
      context: context,
      type: OmniDateTimePickerType.date,
      theme: ThemeData(
        scaffoldBackgroundColor: coolors.white,
        primaryColor: coolors.primaryColor,
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey[700],
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: coolors.black,
        ),
      ),
      is24HourMode: false,
      isShowSeconds: false,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime.now().add(const Duration(days: 500)),
      borderRadius: BorderRadius.circular(12.0),
    );
    if (value != null) {
      return value.dateOnly;
    }
    return '';
  }

  Future<void> setStartDate(BuildContext context) async {
    startYear.text = await showDateTimePicker(context);
    notifyListeners();
  }

  Future<void> setEndDate(BuildContext context) async {
    endYear.text = await showDateTimePicker(context);
    notifyListeners();
  }
}
