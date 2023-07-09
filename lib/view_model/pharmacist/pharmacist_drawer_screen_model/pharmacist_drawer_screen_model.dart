import 'package:tawzeef/repository/services/pharmacist_services/get_pharmacist_notifications_count_services.dart';
import 'package:tawzeef/shared/consts/exports.dart';

class PharmacistDrawerScreenModel extends ChangeNotifier {
  PharmacistDrawerScreenModel(BuildContext context) {
    _getOfficerNotificationsCount(context);
  }
  int unReadCount = 0;
  final getUnreadNotificationServices =
      GetPharmacistNotificationsCountServices();

  Future<void> _getOfficerNotificationsCount(BuildContext context) async {
    await getUnreadNotificationServices.getOfficerNotificationsCount(
      apiToken: localStorage.logUser.apiToken ?? '',
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
