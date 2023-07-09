import 'dart:math';

import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:tawzeef/shared/consts/exports.dart';

class PharmacistHomeScreenModel extends ChangeNotifier {
  bool isLastPage = false;

  int get adIndex {
    return Random().nextInt(ads.length);
  }

  CountryModel? country;
  StateModel? state;
  CityModel? city;
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
  String keyword = '';
  late PagewiseLoadController<JobModel> pageLoadController;

  PharmacistHomeScreenModel(BuildContext context) {
    _loadingFilter(context);
    pageLoadController = PagewiseLoadController<JobModel>(
      pageSize: 20,
      pageFuture: (pageIndex) => getJobs(pageIndex!),
    );
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
      pageLoadController = PagewiseLoadController<JobModel>(
        pageSize: 20,
        pageFuture: (pageIndex) => _searchJobs(pageIndex!),
      );
      notifyListeners();
      pageLoadController.reset();
    }
    context.pop();
  }

  Future<List<JobModel>> _searchJobs(int page) async {
    List<JobModel> jobs = [];
    await searchJobsServices.searchJobs(
      apiToken: localStorage.logUser.apiToken ?? '',
      cityId: city?.id,
      countryId: country?.id,
      stateId: state?.id,
      jobtitleId: jopTitle?.id,
      onSeccuss: (res, message) {
        jobs = res.jobs!;
      },
      onError: (status, error) {},
    );
    return jobs;
  }

  Future<List<JobModel>> getJobs(int page) async {
    List<JobModel> jobs = [];
    await homeJobsServices.homeJobs(
      apiToken: localStorage.logUser.apiToken ?? '',
      page: page,
      onSeccuss: (res, message) {
        if (res.jobs?.isNotEmpty ?? false) {
          jobs = res.jobs!;
          res.ads?.forEach((element) {
            if (!ads.contains(element)) ads.add(element);
          });
        }
      },
      onError: (status, message) {},
    );
    return jobs;
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

  void makeSearch(value) {
    keyword = value;
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
