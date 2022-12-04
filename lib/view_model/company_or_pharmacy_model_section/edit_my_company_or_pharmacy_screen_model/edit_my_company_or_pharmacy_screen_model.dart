import 'package:tawzeef/shared/consts/exports.dart';

class EditMyCompanyOrPharnamcyScreenModel extends ChangeNotifier {
  File? profileImg;
  CountryModel? country;
  CityModel? city;
  StateModel? state;
  List<CountryModel> countries = [];
  List<StateModel> states = [];
  List<CityModel> cities = [];
  final editCompanyServices = EditCompanyOrPharmacyProfileServices();
  final countryServices = GetCountriesServices();
  final stateServices = GetStatesServices();
  final cityServices = GetCitiesServices();
  final description = TextEditingController();
  final noOfEmployees = TextEditingController();
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final facebook = TextEditingController();
  final twitter = TextEditingController();
  final website = TextEditingController();
  final linkedin = TextEditingController();

  EditMyCompanyOrPharnamcyScreenModel(BuildContext context) {
    _loadEditCompanyProfile(context);
  }

  Future<void> _loadEditCompanyProfile(BuildContext context) async {
    await getCountries(context);
  }

  Future<void> editCompanyProfile(
      BuildContext context, Function afterEdit) async {
    if (email.text != localStorage.logUser.email ||
        phone.text != localStorage.logUser.phone ||
        name.text != localStorage.logUser.name ||
        email.text != localStorage.logUser.email ||
        description.text != localStorage.logUser.description ||
        noOfEmployees.text != localStorage.logUser.noOfEmployees ||
        facebook.text != localStorage.logUser.facebook ||
        linkedin.text != localStorage.logUser.linkedin ||
        twitter.text != localStorage.logUser.twitter ||
        website.text != localStorage.logUser.website ||
        city != null ||
        country != null ||
        state != null ||
        profileImg != null) {
      Loader.show(context: context);
      await editCompanyServices.editProfile(
        apiToken: localStorage.logUser.apiToken!,
        img: profileImg,
        cityId: city?.id,
        countryId: country?.id,
        stateId: state?.id,
        name: name.text,
        description: description.text,
        email: email.text,
        phone: phone.text,
        context: context,
        facebook: facebook.text,
        linkedin: linkedin.text,
        noOfEmployees: noOfEmployees.text,
        twitter: twitter.text,
        website: website.text,
        onSeccuss: (res, message) {
          Loader.dismiss(context);
          Toast.showOnSuccessfully(context, message);
          localStorage.loggedUser(res.user!.toJson());
          afterEdit();
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

  Future<void> getCountries(BuildContext context) async {
    await countryServices.getCountries(
      apiToken: localStorage.logUser.apiToken ?? '',
      context: context,
      onSeccuss: (res, message) {
        if (res.country != null) {
          countries = res.country ?? [];
          states = [];
          cities = [];
          city = null;
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
    Loader.loading();
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
    Loader.loading();
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
}
