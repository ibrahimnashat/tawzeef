import 'package:tawzeef/shared/consts/exports.dart';

class PharmacistNotificationsScreenModel extends ChangeNotifier {
  PharmacistNotificationsScreenModel(BuildContext context) {
    _getOfficerNotifications(context);
  }
  bool isLoading = true;
  List<NotificactionModel> notifications = [];
  final getNotificationsServices = GetPharmacistNotificationsServices();

  Future<void> _getOfficerNotifications(BuildContext context) async {
    await getNotificationsServices.getOfficerNotifications(
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
