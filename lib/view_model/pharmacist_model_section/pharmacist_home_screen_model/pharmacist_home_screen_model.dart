import 'dart:math';

import 'package:tawzeef/shared/consts/exports.dart';

class PharmacistHomeScreenModel extends ChangeNotifier {
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
  List<CountryModel> countries = [];
  List<StateModel> states = [];
  List<CityModel> cities = [];
  final List<AdModel> ads = [];
  final homeJobsServices = GetPharmacistHomeJobsServices();
  final jobTitlesServices = GetJobTitlesServices();
  final searchJobsServices = PharmacistSearchJobsServices();
  final countryServices = GetCountriesServices();
  final stateServices = GetStatesServices();
  final cityServices = GetCitiesServices();
  final search = TextEditingController();

  PharmacistHomeScreenModel(BuildContext context) {
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
        apiToken: localStorage.logUser.apiToken ?? '',
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
      apiToken: localStorage.logUser.apiToken ?? '',
      page: page,
      context: context,
      onSeccuss: (res, message) {
        if (res.jobs?.isNotEmpty ?? false) {
          res.jobs?.forEach((element) {
            if (!_jobs.contains(element)) _jobs.add(element);
          });
          res.ads?.forEach((element) {
            if (!ads.contains(element)) ads.add(element);
          });
          currentJobs = _jobs;
          page++;
        }
        isLastPage = _jobs.length % 20 != 0;
        notifyListeners();
      },
      onError: (status, message) {},
    );
  }

  Future<void> getJobTitles(BuildContext context) async {
    await jobTitlesServices.getJobTitles(
      apiToken: localStorage.logUser.apiToken ?? '',
      onSeccuss: (res, message) {
        jobTitles.addAll(res.job!);
        notifyListeners();
      },
      onError: (status, message) {},
    );
  }

  Future<void> getCountries(BuildContext context) async {
    await countryServices.getCountries(
      apiToken: localStorage.logUser.apiToken ?? '',
      context: context,
      onSeccuss: (res, message) {
        if (res.country != null) {
          countries = res.country ?? [];
          states = [];
          cities = [];
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
    Loader.show(context: context);
    await stateServices.getStates(
      apiToken: localStorage.logUser.apiToken ?? '',
      countryId: country!.id!,
      context: context,
      onSeccuss: (res, message) {
        Loader.dismiss(context);
        if (res.state != null) {
          states = res.state ?? [];
          cities = [];
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
          cities = res.city ?? [];
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
