import 'package:tawzeef/shared/consts/exports.dart';

class CompanyOrPharnamcyNotificationsScreenModel extends ChangeNotifier {
  CompanyOrPharnamcyNotificationsScreenModel(BuildContext context) {
    _getCompnayNotifications(context);
  }
  bool isLoading = true;
  List<NotificactionModel> notifications = [];
  final getNotificationsServices = GetCompanyOrPharmacyNotificationsServices();

  Future<void> _getCompnayNotifications(BuildContext context) async {
    await getNotificationsServices.getCompnayNotifications(
      apiToken: localSavingData.logUser.apiToken ?? '',
      onSeccuss: (res, message) {
        notifications = res.notifications!;
        isLoading = false;
        notifyListeners();
      },
      onError: (status, error) {
        Toast.showOnError(context, error);
        isLoading = false;
        notifyListeners();
      },
    );
  }
}
