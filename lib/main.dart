import 'shared/consts/exports.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await localSavingData.getPref();
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
        return MaterialApp(
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
            return ResponsiveWrapper.builder(
              child,
              maxWidth: 1200,
              minWidth: 480,
              defaultScale: true,
              defaultName: MOBILE,
              defaultNameLandscape: MOBILE,
              breakpoints: [
                const ResponsiveBreakpoint.resize(
                  480,
                  name: MOBILE,
                  scaleFactor: 0.85,
                ),
                const ResponsiveBreakpoint.autoScale(
                  800,
                  name: TABLET,
                  scaleFactor: 0.9,
                ),
                const ResponsiveBreakpoint.resize(
                  1000,
                  name: DESKTOP,
                ),
                const ResponsiveBreakpoint.autoScale(
                  2460,
                  name: '4K',
                ),
              ],
            );
          },
        );
      }),
    );
  }

  @override
  void onClick(RemoteMessage notification) {
    fCMNotification.onClick();
  }
}
