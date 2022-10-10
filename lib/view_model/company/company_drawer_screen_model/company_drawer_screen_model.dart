import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/services/company_services/get_company_notifications_count_services.dart';

class CompanyDrawerScreenModel extends ChangeNotifier {
  CompanyDrawerScreenModel(BuildContext context) {
    _getCompanyNotificationsCount(context);
  }
  int unReadCount = 0;
  final getUnreadNotificationServices = GetCompanyNotificationsCountServices();

  Future<void> _getCompanyNotificationsCount(BuildContext context) async {
    await getUnreadNotificationServices.getCompanyNotificationsCount(
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
