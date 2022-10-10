import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/objects/career_level_model.dart';
import 'package:tawzeef/models/objects/city_model.dart';
import 'package:tawzeef/models/objects/country_model.dart';
import 'package:tawzeef/models/objects/job_experience_model.dart';
import 'package:tawzeef/models/objects/job_shift_model.dart';
import 'package:tawzeef/models/objects/job_title_model.dart';
import 'package:tawzeef/models/objects/job_type_model.dart';
import 'package:tawzeef/models/objects/state_model.dart';
import 'package:tawzeef/services/company_services/add_job_services.dart';
import 'package:tawzeef/services/company_services/edit_job_services.dart';
import 'package:tawzeef/services/get_career_level_services.dart';
import 'package:tawzeef/services/get_cities_services.dart';
import 'package:tawzeef/services/get_countries_services.dart';
import 'package:tawzeef/services/get_job_experience_services.dart';
import 'package:tawzeef/services/get_job_shift_services.dart';
import 'package:tawzeef/services/get_job_titles_services.dart';
import 'package:tawzeef/services/get_job_types_services.dart';
import 'package:tawzeef/services/get_states_services.dart';

class AddJobScreenModel extends ChangeNotifier {
  CountryModel? country;
  CityModel? city;
  StateModel? state;
  JobShiftModel? jobShift;
  CareerLevelModel? careerLevel;
  JobTypeModel? jobType;
  JobExperienceModel? jobExperience;
  JobTitleModel? jobTitle;
  final List<CountryModel> countries = [];
  final List<StateModel> states = [];
  final List<CityModel> cities = [];
  final List<JobShiftModel> jobShifts = [];
  final List<CareerLevelModel> careerLevels = [];
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
      getCareerLevels(context),
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
        careerLevel != null &&
        jobType != null &&
        jobExperience != null &&
        jobTitle != null) {
      Loader.show(context: context);
      await addJobServices.addJob(
        apiToken: localSavingData.logUser.apiToken ?? '',
        careerLevelId: careerLevel?.id,
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
        careerLevel != null ||
        jobType != null ||
        jobExperience != null ||
        jobTitle != null) {
      Loader.show(context: context);
      await editJobServices.editJob(
        jobId: jobId,
        apiToken: localSavingData.logUser.apiToken ?? '',
        careerLevelId: careerLevel?.id,
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
          if (loginType.userType == UserType.officer) {
            context.pushAndRemoveUntil(const OfficerHomeScreen());
          } else {
            context.pushAndRemoveUntil(const CompanyHomeScreen());
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

  void changeCareerLevel(CareerLevelModel careerLevel) {
    this.careerLevel = careerLevel;
  }

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
      apiToken: localSavingData.logUser.apiToken ?? '',
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
      apiToken: localSavingData.logUser.apiToken ?? '',
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
      apiToken: localSavingData.logUser.apiToken ?? '',
      onSeccuss: (res, message) {
        jobTypes.addAll(res.jobTypes!);
        notifyListeners();
      },
      onError: (status, error) {
        Toast.showOnError(context, error);
      },
    );
  }

  Future<void> getCareerLevels(BuildContext context) async {
    await careerLevelsServices.getCareerLevels(
      apiToken: localSavingData.logUser.apiToken ?? '',
      onSeccuss: (res, message) {
        careerLevels.addAll(res.careerLevels!);
        notifyListeners();
      },
      onError: (status, error) {
        Toast.showOnError(context, error);
      },
    );
  }

  Future<void> getJobShifts(BuildContext context) async {
    await jobShiftsServices.jobShifts(
      apiToken: localSavingData.logUser.apiToken ?? '',
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
      apiToken: localSavingData.logUser.apiToken ?? '',
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
    await stateServices.getStates(
      apiToken: localSavingData.logUser.apiToken ?? '',
      countryId: country!.id!,
      context: context,
      onSeccuss: (res, message) {
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
    await cityServices.getCities(
      apiToken: localSavingData.logUser.apiToken ?? '',
      stateId: state!.id!,
      context: context,
      onSeccuss: (res, message) {
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
      primaryColor: coolors.primaryColor,
      backgroundColor: coolors.white,
      calendarTextColor: Colors.grey[700],
      tabTextColor: Colors.white,
      unselectedTabBackgroundColor: Colors.grey[700],
      buttonTextColor: coolors.black,
      is24HourMode: false,
      isShowSeconds: false,
      startInitialDate: DateTime.now(),
      startFirstDate: DateTime(1980),
      startLastDate: DateTime.now().add(const Duration(days: 500)),
      borderRadius: const Radius.circular(12),
    );
    if (value != null) {
      return value.dateOnly;
    }
    return '';
  }
}
