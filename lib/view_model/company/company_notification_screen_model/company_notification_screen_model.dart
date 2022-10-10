import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/objects/notification_model.dart';
import 'package:tawzeef/services/company_services/get_company_notifications_services.dart';

class CompanyNotificationsScreenModel extends ChangeNotifier {
  CompanyNotificationsScreenModel(BuildContext context) {
    _getCompnayNotifications(context);
  }
  bool isLoading = true;
  List<NotificactionModel> notifications = [];
  final getNotificationsServices = GetCompanyNotificationsServices();

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
