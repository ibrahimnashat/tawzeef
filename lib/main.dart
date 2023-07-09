import 'package:tawzeef/shared/widgets/response.dart';

import 'shared/consts/exports.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await localStorage.getPref();
  await fCMNotification.onIntialization();
  runApp(const TawzeefApp());
}

class TawzeefApp extends StatefulWidget {
  const TawzeefApp({Key? key}) : super(key: key);

  @override
  State<TawzeefApp> createState() => _TawzeefAppState();
}

class _TawzeefAppState extends State<TawzeefApp>
    with FCMNotificationClickMixin {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(builder: (context, ref, child) {
        final controller = ref.watch(
            ChangeNotifierProvider<SettingsScreenModel>((ref) => settings));
        return MResponsiveWrapper(
          child: MaterialApp(
            navigatorKey: navigatorKey,
            locale: controller.locale,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              controller.delegate,
            ],
            supportedLocales: const [
              Locale("en"),
              Locale("ar"),
            ],
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
            builder: (context, child) {
              return MResponsiveWrapper.wrapper(
                child: child!,
                context: context,
              );
            },
          ),
        );
      }),
    );
  }

  @override
  void onClick(RemoteMessage notification) {
    fCMNotification.onClick();
  }
}
