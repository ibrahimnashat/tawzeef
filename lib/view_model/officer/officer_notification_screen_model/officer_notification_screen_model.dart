import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/objects/notification_model.dart';
import 'package:tawzeef/services/officer_services/get_officer_notifications_services.dart';

class OfficerNotificationsScreenModel extends ChangeNotifier {
  OfficerNotificationsScreenModel(BuildContext context) {
    _getOfficerNotifications(context);
  }
  bool isLoading = true;
  List<NotificactionModel> notifications = [];
  final getNotificationsServices = GetOfficerNotificationsServices();

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
