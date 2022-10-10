import 'dart:math';

import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/objects/ad_model.dart';
import 'package:tawzeef/models/objects/city_model.dart';
import 'package:tawzeef/models/objects/country_model.dart';
import 'package:tawzeef/models/objects/job_model.dart';
import 'package:tawzeef/models/objects/job_title_model.dart';
import 'package:tawzeef/models/objects/state_model.dart';
import 'package:tawzeef/services/get_cities_services.dart';
import 'package:tawzeef/services/get_countries_services.dart';
import 'package:tawzeef/services/get_job_titles_services.dart';
import 'package:tawzeef/services/get_states_services.dart';
import 'package:tawzeef/services/officer_services/get_officer_home_jobs_services.dart';
import 'package:tawzeef/services/officer_services/officer_search_jobs_services.dart';

class OfficerHomeScreenModel extends ChangeNotifier {
  int page = 1;
  bool isNotFound = false;
  bool isLastPage = false;
  int get adIndex {
    return Random().nextInt(ads.length);
  }

  CountryModel? country;
  StateModel? state;
  CityModel? city;
  List<JobModel> currentJobs = [];
  final List<JobModel> _jobs = [];
  final List<JobTitleModel> jobTitles = [];
  final List<CountryModel> countries = [];
  final List<StateModel> states = [];
  final List<CityModel> cities = [];
  final List<AdModel> ads = [];
  final homeJobsServices = GetOfficerHomeJobsServices();
  final jobTitlesServices = GetJobTitlesServices();
  final searchJobsServices = OfficerSearchJobsServices();
  final countryServices = GetCountriesServices();
  final stateServices = GetStatesServices();
  final cityServices = GetCitiesServices();
  final search = TextEditingController();

  OfficerHomeScreenModel(BuildContext context) {
    _loadingFilter(context);
  }

  JobTitleModel? jopTitle;

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

  void changeJopTitle(JobTitleModel jopTitle) {
    this.jopTitle = jopTitle;
  }

  Future<void> _loadingFilter(BuildContext context) async {
    await Future.wait([
      getJobTitles(context),
      getCountries(context),
    ]);
  }

  Future<void> searchJob(BuildContext context) async {
    if (country != null || city != null || state != null || jopTitle != null) {
      Loader.show(context: context);
      await searchJobsServices.searchJobs(
        apiToken: localSavingData.logUser.apiToken ?? '',
        context: context,
        cityId: city?.id,
        countryId: country?.id,
        stateId: state?.id,
        jobtitleId: jopTitle?.id,
        onSeccuss: (res, message) {
          Loader.dismiss(context);
          res.jobs?.forEach((element) {
            if (!_jobs.contains(element)) _jobs.add(element);
          });
          currentJobs = _jobs;
          isNotFound = _jobs.isEmpty;
          notifyListeners();
          context.pop();
        },
        onError: (status, error) {
          Toast.showOnError(context, error);
        },
      );
    }
  }

  Future<void> getJobs(BuildContext context) async {
    homeJobsServices.homeJobs(
      apiToken: localSavingData.logUser.apiToken ?? '',
      page: page,
      context: context,
      onSeccuss: (res, message) {
        if (res.jobs!.isNotEmpty) {
          res.jobs?.forEach((element) {
            if (!_jobs.contains(element)) _jobs.add(element);
          });
          res.ads?.forEach((element) {
            if (!ads.contains(element)) ads.add(element);
          });
          currentJobs = _jobs;
          page++;
          isLastPage = false;
        } else {
          isLastPage = true;
        }
        notifyListeners();
      },
      onError: (status, message) {},
    );
  }

  Future<void> getJobTitles(BuildContext context) async {
    await jobTitlesServices.getJobTitles(
      apiToken: localSavingData.logUser.apiToken ?? '',
      onSeccuss: (res, message) {
        jobTitles.addAll(res.job!);
        notifyListeners();
      },
      onError: (status, message) {},
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
          cities.clear();
          state = null;
          city = null;
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

  void makeSearch(keyword) {
    final res = _jobs.where((element) =>
        element.jobTitle?.title?.toLowerCase().contains(keyword) ?? false);
    List<JobModel> result = [];
    result.addAll(res);
    if (search.text.isNotEmpty) {
      currentJobs = result;
    } else {
      currentJobs = _jobs;
    }
    isNotFound = currentJobs.isEmpty && _jobs.isNotEmpty;
    notifyListeners();
  }

  void viewBottomSheet(BuildContext context, Widget widget) {
    showBottomSheet(
      context: context,
      shape: const OutlineInputBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
        borderSide: BorderSide.none,
      ),
      elevation: 5.0,
      constraints: BoxConstraints(maxHeight: context.h * 0.7),
      builder: (BuildContext context) => widget,
    );
  }
}
