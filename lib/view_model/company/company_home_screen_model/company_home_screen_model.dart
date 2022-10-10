import 'dart:math';

import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/objects/ad_model.dart';
import 'package:tawzeef/models/objects/city_model.dart';
import 'package:tawzeef/models/objects/country_model.dart';
import 'package:tawzeef/models/objects/state_model.dart';
import 'package:tawzeef/models/objects/user_model.dart';
import 'package:tawzeef/services/company_services/company_search_users_services.dart';
import 'package:tawzeef/services/company_services/get_company_home_users_services.dart';
import 'package:tawzeef/services/get_cities_services.dart';
import 'package:tawzeef/services/get_countries_services.dart';
import 'package:tawzeef/services/get_states_services.dart';

class CompanyHomeScreenModel extends ChangeNotifier {
  int page = 1;
  bool isNotFound = false;
  bool isLastPage = false;

  int get adIndex {
    return Random().nextInt(ads.length);
  }

  final List<AdModel> ads = [];
  CountryModel? country;
  StateModel? state;
  CityModel? city;
  List<UserModel> currentUsers = [];
  final List<UserModel> _users = [];
  final List<CountryModel> countries = [];
  final List<StateModel> states = [];
  final List<CityModel> cities = [];
  final homeUsersServices = GetCompanyHomeUsersServices();
  final searchJobsServices = CompanySearchUsersServices();
  final countryServices = GetCountriesServices();
  final stateServices = GetStatesServices();
  final cityServices = GetCitiesServices();
  final search = TextEditingController();

  CompanyHomeScreenModel(BuildContext context) {
    _loadingHome(context);
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
      Loader.show(context: context);
      await searchJobsServices.searchJobs(
        apiToken: localSavingData.logUser.apiToken ?? '',
        context: context,
        cityId: city?.id,
        countryId: country?.id,
        stateId: state?.id,
        onSeccuss: (res, message) {
          Loader.dismiss(context);
          _users.clear();
          res.users?.forEach((element) {
            if (!_users.contains(element)) _users.add(element);
          });
          currentUsers = _users;
          isNotFound = _users.isEmpty;
          notifyListeners();
          context.pop();
        },
        onError: (status, error) {
          Toast.showOnError(context, error);
        },
      );
    }
  }

  Future<void> getUsers(BuildContext context) async {
    homeUsersServices.homeUsers(
      apiToken: localSavingData.logUser.apiToken ?? '',
      page: page,
      context: context,
      onSeccuss: (res, message) {
        if (res.users!.isNotEmpty) {
          res.users?.forEach((element) {
            if (!_users.contains(element)) _users.add(element);
          });
          res.ads?.forEach((element) {
            if (!ads.contains(element)) ads.add(element);
          });
          currentUsers = _users;
          page++;
        }
        isLastPage = true;
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
      countryId: country!.id!,
      apiToken: localSavingData.logUser.apiToken ?? '',
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
    final res = _users.where(
        (element) => element.name?.toLowerCase().contains(keyword) ?? false);
    List<UserModel> result = [];
    result.addAll(res);
    if (search.text.isNotEmpty) {
      currentUsers = result;
    } else {
      currentUsers = _users;
    }
    isNotFound = currentUsers.isEmpty && _users.isNotEmpty;
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
