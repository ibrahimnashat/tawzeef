import 'package:tawzeef/shared/consts/exports.dart';

class AddJobScreenModel extends ChangeNotifier {
  CountryModel? country;
  CityModel? city;
  StateModel? state;
  JobShiftModel? jobShift;

  // CareerLevelModel? careerLevel;
  JobTypeModel? jobType;
  JobExperienceModel? jobExperience;
  JobTitleModel? jobTitle;
  final List<CountryModel> countries = [];
  final List<StateModel> states = [];
  final List<CityModel> cities = [];
  final List<JobShiftModel> jobShifts = [];

  // final List<CareerLevelModel> careerLevels = [];
  final List<JobTypeModel> jobTypes = [];
  final List<JobExperienceModel> jobExperiences = [];
  final List<JobTitleModel> jobTitles = [];

  final description = TextEditingController();
  final salary = TextEditingController();
  final noOfPositions = TextEditingController();
  final jobExpired = TextEditingController();

  final addJobServices = AddJobServices();
  final editJobServices = EditJobServices();
  final careerLevelsServices = GetCareerLevelServices();
  final jobTypesServices = GetJobTypesServices();
  final jobShiftsServices = GetJobShiftServices();
  final jobExperienceServices = GetJobExperienceServices();
  final countryServices = GetCountriesServices();
  final stateServices = GetStatesServices();
  final cityServices = GetCitiesServices();
  final getJobTitleServices = GetJobTitlesServices();

  AddJobScreenModel(BuildContext context) {
    _loadAddJob(context);
  }

  Future<void> _loadAddJob(BuildContext context) async {
    await Future.wait([
      getJobTitle(context),
      getJobTypes(context),
      getJobExperience(context),
      //  getCareerLevels(context),
      getJobShifts(context),
      getCountries(context),
    ]);
  }

  Future<void> addJob(BuildContext context) async {
    if (description.text.isNotEmpty &&
        salary.text.isNotEmpty &&
        noOfPositions.text.isNotEmpty &&
        jobExpired.text.isNotEmpty &&
        country != null &&
        jobShift != null &&
        // careerLevel != null &&
        jobType != null &&
        jobExperience != null &&
        jobTitle != null) {
      Loader.show(context: context);
      await addJobServices.addJob(
        apiToken: localStorage.logUser.apiToken ?? '',
        //  careerLevelId: careerLevel?.id,
        countryId: country?.id,
        stateId: state?.id,
        cityId: city?.id,
        jobExperienceId: jobExperience?.id,
        jobShiftId: jobShift?.id,
        jobTypeId: jobType?.id,
        jobExpired: jobExpired.text,
        description: description.text,
        jobTitleId: jobTitle?.id,
        numOfPositions: noOfPositions.text,
        salary: salary.text,
        context: context,
        onSeccuss: (res, message) async {
          Loader.dismiss(context);
          context.pop();
          Toast.showOnSuccessfully(context, message);
        },
        onError: (status, error) {
          Toast.showOnError(context, error);
        },
      );
    } else {
      Toast.showOnError(context, context.localization?.pleaseCompleteYourData);
    }
  }

  Future<void> editJob(BuildContext context, int? jobId) async {
    if (description.text.isNotEmpty ||
        salary.text.isNotEmpty ||
        noOfPositions.text.isNotEmpty ||
        jobExpired.text.isNotEmpty ||
        country != null ||
        jobShift != null ||
        //  careerLevel != null ||
        jobType != null ||
        jobExperience != null ||
        jobTitle != null) {
      Loader.show(context: context);
      await editJobServices.editJob(
        jobId: jobId,
        apiToken: localStorage.logUser.apiToken ?? '',
        // careerLevelId: careerLevel?.id,
        countryId: country?.id,
        stateId: state?.id,
        cityId: city?.id,
        jobExperienceId: jobExperience?.id,
        jobShiftId: jobShift?.id,
        jobTypeId: jobType?.id,
        jobExpired: jobExpired.text,
        description: description.text,
        jobTitleId: jobTitle?.id,
        numOfPositions: noOfPositions.text,
        salary: salary.text,
        context: context,
        onSeccuss: (res, message) {
          Loader.dismiss(context);
          if (loginType.userType == UserType.pharmacist) {
            context.pushAndRemoveUntil(const PharmacistHomeScreen());
          } else {
            context.pushAndRemoveUntil(const CompanyOrPharmacyHomeScreen());
          }
        },
        onError: (status, error) {
          Toast.showOnError(context, error);
        },
      );
    } else {
      Toast.showOnError(context, context.localization?.pleaseEnterDataToChange);
    }
  }

  Future<void> changeCountry(CountryModel country, BuildContext context) async {
    this.country = country;
    await getStates(context);
  }

  Future<void> changeState(StateModel state, BuildContext context) async {
    this.state = state;
    await getCities(context);
  }

  void changeCity(CityModel city) {
    this.city = city;
  }

  void changeJobShift(JobShiftModel jobShift) {
    this.jobShift = jobShift;
  }

  // void changeCareerLevel(CareerLevelModel careerLevel) {
  //   this.careerLevel = careerLevel;
  // }

  void changeJobType(JobTypeModel jobType) {
    this.jobType = jobType;
  }

  void changeJobExperience(JobExperienceModel jobExperience) {
    this.jobExperience = jobExperience;
  }

  void changeJobTitle(JobTitleModel jobTitle) {
    this.jobTitle = jobTitle;
  }

  Future<void> setJobExpired(BuildContext context) async {
    jobExpired.text = await showDateTimePicker(context);
    notifyListeners();
  }

  Future<void> getJobExperience(BuildContext context) async {
    await jobExperienceServices.getJobExperience(
      apiToken: localStorage.logUser.apiToken ?? '',
      onSeccuss: (res, message) {
        jobExperiences.addAll(res.jobExperience!);
        notifyListeners();
      },
      onError: (status, error) {
        Toast.showOnError(context, error);
      },
    );
  }

  Future<void> getJobTitle(BuildContext context) async {
    await getJobTitleServices.getJobTitles(
      apiToken: localStorage.logUser.apiToken ?? '',
      onSeccuss: (res, message) {
        jobTitles.addAll(res.job!);
        notifyListeners();
      },
      onError: (status, error) {
        Toast.showOnError(context, error);
      },
    );
  }

  Future<void> getJobTypes(BuildContext context) async {
    await jobTypesServices.jobTypes(
      apiToken: localStorage.logUser.apiToken ?? '',
      onSeccuss: (res, message) {
        jobTypes.addAll(res.jobTypes!);
        notifyListeners();
      },
      onError: (status, error) {
        Toast.showOnError(context, error);
      },
    );
  }

  // Future<void> getCareerLevels(BuildContext context) async {
  //   await careerLevelsServices.getCareerLevels(
  //     apiToken: localStorage.logUser.apiToken ?? '',
  //     onSeccuss: (res, message) {
  //       careerLevels.addAll(res.careerLevels!);
  //       notifyListeners();
  //     },
  //     onError: (status, error) {
  //       Toast.showOnError(context, error);
  //     },
  //   );
  // }

  Future<void> getJobShifts(BuildContext context) async {
    await jobShiftsServices.jobShifts(
      apiToken: localStorage.logUser.apiToken ?? '',
      onSeccuss: (res, message) {
        jobShifts.addAll(res.jobShifts!);
        notifyListeners();
      },
      onError: (status, error) {
        Toast.showOnError(context, error);
      },
    );
  }

  Future<void> getCountries(BuildContext context) async {
    await countryServices.getCountries(
      apiToken: localStorage.logUser.apiToken ?? '',
      context: context,
      onSeccuss: (res, message) {
        if (res.country != null) {
          countries.addAll(res.country!);
          states.clear();
          state = null;
          notifyListeners();
        }
      },
      onError: (status, error) {
        Toast.showOnError(context, error);
      },
    );
  }

  Future<void> getStates(BuildContext context) async {
    Loader.show(context: context);
    await stateServices.getStates(
      apiToken: localStorage.logUser.apiToken ?? '',
      countryId: country!.id!,
      context: context,
      onSeccuss: (res, message) {
        Loader.dismiss(context);
        if (res.state != null) {
          states.addAll(res.state!);
          cities.clear();
          city = null;
          notifyListeners();
        }
      },
      onError: (status, error) {
        Toast.showOnError(context, error);
      },
    );
  }

  Future<void> getCities(BuildContext context) async {
    Loader.show(context: context);
    await cityServices.getCities(
      apiToken: localStorage.logUser.apiToken ?? '',
      stateId: state!.id!,
      context: context,
      onSeccuss: (res, message) {
        Loader.dismiss(context);
        if (res.city != null) {
          cities.addAll(res.city!);
          notifyListeners();
        }
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
}
