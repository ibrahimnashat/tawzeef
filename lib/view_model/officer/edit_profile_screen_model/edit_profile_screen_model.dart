import 'dart:io';

import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/objects/city_model.dart';
import 'package:tawzeef/models/objects/country_model.dart';
import 'package:tawzeef/models/objects/state_model.dart';
import 'package:tawzeef/services/get_cities_services.dart';
import 'package:tawzeef/services/get_countries_services.dart';
import 'package:tawzeef/services/get_states_services.dart';
import 'package:tawzeef/services/officer_services/edit_officer_profile_services.dart';

class EditProfileScreenModel extends ChangeNotifier {
  File? cvPdf;
  File? profileImg;
  CountryModel? country;
  CityModel? city;
  StateModel? state;
  final List<CountryModel> countries = [];
  final List<StateModel> states = [];
  final List<CityModel> cities = [];
  final editProfileServices = EditOfficerProfileServices();
  final countryServices = GetCountriesServices();
  final stateServices = GetStatesServices();
  final cityServices = GetCitiesServices();
  final dateOfBirth = TextEditingController();
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();

  EditProfileScreenModel(BuildContext context) {
    _loadEditProfile(context);
  }

  Future<void> _loadEditProfile(BuildContext context) async {
    await getCountries(context);
  }

  Future<void> editProfile(BuildContext context) async {
    if (email.text != localSavingData.logUser.email ||
        phone.text != localSavingData.logUser.phone ||
        name.text != localSavingData.logUser.name ||
        email.text != localSavingData.logUser.email ||
        dateOfBirth.text != localSavingData.logUser.dateOfBirth ||
        city != null ||
        country != null ||
        state != null ||
        profileImg != null ||
        cvPdf != null) {
      Loader.show(context: context);
      await editProfileServices.editProfile(
        apiToken: localSavingData.logUser.apiToken!,
        cv: cvPdf,
        img: profileImg,
        cityId: city?.id,
        countryId: country?.id,
        stateId: state?.id,
        name: name.text,
        dateOfBirth: dateOfBirth.text,
        email: email.text,
        phone: phone.text,
        context: context,
        onSeccuss: (res, message) {
          Loader.dismiss(context);
          Toast.showOnSuccessfully(context, message);
          localSavingData.loggedUser(res.user!.toJson());
        },
        onError: (status, error) {
          Toast.showOnError(context, error);
        },
      );
    } else {
      Toast.showOnError(context, context.localization?.pleaseEnterDataToChange);
    }
  }

  Future<void> cvPicker() async {
    final files = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowCompression: true,
      dialogTitle: "Upload CV",
      onFileLoading: (res) => FilePickerStatus.picking,
      allowedExtensions: ['pdf', 'doc'],
      lockParentWindow: true,
      type: FileType.custom,
    );
    if (files!.files.isNotEmpty) {
      cvPdf = File(files.files.first.path!);
      notifyListeners();
    }
  }

  void clearCv() {
    cvPdf = null;
    notifyListeners();
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

  Future<void> imgPicker() async {
    final files = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowCompression: true,
      dialogTitle: "Upload Image",
      onFileLoading: (res) => FilePickerStatus.picking,
      type: FileType.image,
      lockParentWindow: true,
    );
    if (files!.files.isNotEmpty) {
      profileImg = File(files.files.first.path!);
      notifyListeners();
    }
  }

  Future<void> showDateTimePicker(BuildContext context) async {
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
      startLastDate: DateTime.now(),
      borderRadius: const Radius.circular(12),
    );
    if (value != null) {
      dateOfBirth.text = value.dateOnly;
      notifyListeners();
    }
  }
}
