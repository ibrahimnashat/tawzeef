import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/services/officer_services/get_officer_notifications_count_services.dart';

class OfficerDrawerScreenModel extends ChangeNotifier {
  OfficerDrawerScreenModel(BuildContext context) {
    _getOfficerNotificationsCount(context);
  }
  int unReadCount = 0;
  final getUnreadNotificationServices = GetOfficerNotificationsCountServices();

  Future<void> _getOfficerNotificationsCount(BuildContext context) async {
    await getUnreadNotificationServices.getOfficerNotificationsCount(
      apiToken: localSavingData.logUser.apiToken ?? '',
      onSeccuss: (res, message) {
        unReadCount = res.count ?? 0;
        notifyListeners();
      },
      onError: (status, error) {
        Toast.showOnError(context, error);
      },
    );
  }
}
