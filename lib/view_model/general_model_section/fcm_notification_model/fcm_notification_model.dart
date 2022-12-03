import 'package:tawzeef/shared/consts/exports.dart';
import 'package:tawzeef/main.dart';

Future<void> _onMessagingBackground(RemoteMessage message) async {
  await FCMConfig.instance.local.displayNotificationFrom(message);
}

FCMNotificationModel fCMNotification = FCMNotificationModel._private();

class FCMNotificationModel extends ChangeNotifier {
  Future<String?> getFCMToken() async {
    final value = await FCMConfig.instance.messaging.getToken();
    localStorage.print('FCMToken: $value');
    return value;
  }

  Future<void> onIntialization() async {
    await FCMConfig.instance.init(
      onBackgroundMessage: _onMessagingBackground,
      defaultAndroidChannel: const AndroidNotificationChannel(
        'fcm_channel',
        'fcm_title',
        importance: Importance.high,
        sound: RawResourceAndroidNotificationSound('notification'),
      ),
    );
    getFCMToken();
  }

  void onClick() {
    if (localStorage.logUser.email != null) {
      if (loginType.userType == UserType.pharmacist) {
        navigatorKey.currentState!.push(MaterialPageRoute(
            builder: ((context) => const PharmacistNotificationScreen())));
      } else {
        navigatorKey.currentState!.push(MaterialPageRoute(
            builder: ((context) =>
                const CompanyOrPharmacyNotificationScreen())));
      }
    } else {
      navigatorKey.currentState!.push(
          MaterialPageRoute(builder: ((context) => const LoginTypeScreen())));
    }
  }

  FCMNotificationModel._private();
}
