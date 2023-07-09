import 'dart:math';

import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:tawzeef/shared/consts/exports.dart';

class CompanyOrPharnamcyHomeScreenModel extends ChangeNotifier {
  int get adIndex {
    return Random().nextInt(ads.length);
  }

  final List<AdModel> ads = [];
  CountryModel? country;
  StateModel? state;
  CityModel? city;
  List<CountryModel> countries = [];
  List<StateModel> states = [];
  List<CityModel> cities = [];
  final homeUsersServices = GetCompanyOrPharmacyHomeUsersServices();
  final searchJobsServices = CompanyOrPharmacySearchUsersServices();
  final countryServices = GetCountriesServices();
  final stateServices = GetStatesServices();
  final cityServices = GetCitiesServices();
  final search = TextEditingController();
  String keyword = '';
  late PagewiseLoadController<UserModel> pageLoadController;

  CompanyOrPharnamcyHomeScreenModel(BuildContext context) {
    _loadingHome(context);
    pageLoadController = PagewiseLoadController<UserModel>(
      pageSize: 20,
      pageFuture: (pageIndex) => getUsers(pageIndex!),
    );
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

  Future<void> _loadingHome(BuildContext context) async {
    await Future.wait([
      getCountries(context),
    ]);
  }

  Future<void> searchUsers(BuildContext context) async {
    if (country != null || city != null || state != null) {
      pageLoadController = PagewiseLoadController<UserModel>(
        pageSize: 20,
        pageFuture: (pageIndex) => _getSearch(pageIndex!),
      );
      notifyListeners();
      pageLoadController.reset();
    }
    context.pop();
  }

  Future<List<UserModel>> _getSearch(int page) async {
    List<UserModel> users = [];
    await searchJobsServices.searchJobs(
      apiToken: localStorage.logUser.apiToken ?? '',
      cityId: city?.id,
      countryId: country?.id,
      stateId: state?.id,
      onSeccuss: (res, message) {
        users = res.users!;
      },
      onError: (status, error) {},
    );
    return users;
  }

  Future<List<UserModel>> getUsers(int page) async {
    List<UserModel> users = [];
    homeUsersServices.homeUsers(
      apiToken: localStorage.logUser.apiToken ?? '',
      page: page,
      onSeccuss: (res, message) {
        if (res.users!.isNotEmpty) {
          users = res.users ?? [];
          res.ads?.forEach((element) {
            if (!ads.contains(element)) ads.add(element);
          });
        }
      },
      onError: (status, message) {},
    );
    return users;
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
      countryId: country!.id!,
      apiToken: localStorage.logUser.apiToken ?? '',
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
