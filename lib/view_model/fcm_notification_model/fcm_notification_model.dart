import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/main.dart';

Future<void> _onMessagingBackground(RemoteMessage message) async {
  await FCMConfig.instance.local.displayNotificationFrom(message);
}

FCMNotificationModel fCMNotification = FCMNotificationModel._private();

class FCMNotificationModel extends ChangeNotifier {
  Future<String?> getFCMToken() async {
    final value = await FCMConfig.instance.messaging.getToken();
    localSavingData.debuggerPrint('FCMToken: $value');
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
    if (localSavingData.logUser.email != null) {
      if (loginType.userType == UserType.pharmacist) {
        navigatorKey.currentState!.push(MaterialPageRoute(
            builder: ((context) => const OfficerNotificationScreen())));
      } else {
        navigatorKey.currentState!.push(MaterialPageRoute(
            builder: ((context) => const CompanyNotificationScreen())));
      }
    } else {
      navigatorKey.currentState!.push(
          MaterialPageRoute(builder: ((context) => const LoginTypeScreen())));
    }
  }

  FCMNotificationModel._private();
}
