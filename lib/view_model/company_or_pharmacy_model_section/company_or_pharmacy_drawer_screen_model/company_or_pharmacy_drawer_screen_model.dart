import 'package:tawzeef/shared/consts/exports.dart';
import 'package:tawzeef/repository/services/company_or_pharmacy_services/get_company_or_pharmacy_notifications_count_services.dart';

class CompanyOrPharnamcyDrawerScreenModel extends ChangeNotifier {
  CompanyOrPharnamcyDrawerScreenModel(BuildContext context) {
    _getCompanyNotificationsCount(context);
  }
  int unReadCount = 0;
  final getUnreadNotificationServices =
      GetCompanyOrPharmacyNotificationsCountServices();

  Future<void> _getCompanyNotificationsCount(BuildContext context) async {
    await getUnreadNotificationServices.getCompanyNotificationsCount(
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
