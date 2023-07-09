import 'package:tawzeef/shared/consts/exports.dart';
import 'widgets/notification_item.dart';

class PharmacistNotificationScreen extends StatefulWidget {
  const PharmacistNotificationScreen({Key? key}) : super(key: key);

  @override
  State<PharmacistNotificationScreen> createState() =>
      _PharmacistNotificationScreenState();
}

class _PharmacistNotificationScreenState
    extends State<PharmacistNotificationScreen> {
  late AutoDisposeChangeNotifierProvider<PharmacistNotificationsScreenModel>
      notificationsController =
      AutoDisposeChangeNotifierProvider<PharmacistNotificationsScreenModel>(
          (ref) => PharmacistNotificationsScreenModel(context));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: coolors.white,
      appBar: PreferredSize(
        preferredSize: Size(context.w, 90),
        child: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: MSvg(
                  name: svgs.back,
                  height: 30,
                  width: 30,
                )
                    .mFlap
                    .mPadding(
                      start: spaces.space21,
                    )
                    .mAddAction(onTap: () => context.pop()),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MSvg(
                      name: svgs.notification,
                      color: coolors.primaryColor,
                      width: 32,
                      height: 32,
                    ).mPadding(end: spaces.space12),
                    MText(
                      text: context.localization?.notifications,
                      fontColor: coolors.black,
                      fontFamily: foontFamily.tajawalBold,
                      fontSize: foontSize.font22,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Divider(
                  indent: spaces.space21,
                  endIndent: spaces.space21,
                ),
              )
            ],
          ),
        ),
      ),
      body: Consumer(builder: (context, ref, child) {
        final controller = ref.watch(notificationsController);
        if (controller.isLoading) {
          return Loader.loading();
        } else if (controller.notifications.isEmpty) {
          return Loader.empty();
        }
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: spaces.space21),
          child: Column(
            children: controller.notifications
                .map(
                  (e) => NotificationItem(
                    notificaction: e,
                  ),
                )
                .toList(),
          ),
        );
      }),
    );
  }
}
