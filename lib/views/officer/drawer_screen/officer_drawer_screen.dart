import 'package:tawzeef/controller/consts/exports.dart';

import 'widgets/officer_drawer_item.dart';

class OfficerDrawerScreen extends StatefulWidget {
  const OfficerDrawerScreen({Key? key}) : super(key: key);

  @override
  State<OfficerDrawerScreen> createState() => _OfficerDrawerScreenState();
}

class _OfficerDrawerScreenState extends State<OfficerDrawerScreen> {
  late ChangeNotifierProvider<OfficerDrawerScreenModel> drawerController =
      ChangeNotifierProvider<OfficerDrawerScreenModel>(
          (ref) => OfficerDrawerScreenModel(context));
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      width: context.w * 0.8,
      backgroundColor: Colors.transparent,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsetsDirectional.only(top: 210),
          padding: EdgeInsetsDirectional.only(
            start: spaces.space24,
            end: spaces.space24,
            top: spaces.space12,
            bottom: spaces.space24,
          ),
          decoration: BoxDecoration(
            color: coolors.white,
            borderRadius: const BorderRadiusDirectional.only(
              topEnd: Radius.circular(200),
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(1.5),
                      margin: EdgeInsetsDirectional.only(end: spaces.space12),
                      decoration: BoxDecoration(
                        color: coolors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Consumer(builder: (context, ref, child) {
                        final controller = ref.watch(
                            ChangeNotifierProvider((ref) => localSavingData));
                        return MNetworkImage(
                          url: controller.logUser.image ?? '',
                          fit: BoxFit.cover,
                          borderRadius: 100,
                          height: 100,
                          width: 100,
                        );
                      }),
                    ).mAddAction(
                      onTap: () => context.push(const MyProfileScreen()),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer(builder: (context, ref, child) {
                          final controller = ref.watch(
                              ChangeNotifierProvider((ref) => localSavingData));
                          return MText(
                            text:
                                "${context.localization?.hi} ${controller.logUser.name},",
                            fontFamily: foontFamily.tajawalBold,
                            fontColor: coolors.primaryColor,
                            fontSize: foontSize.font20,
                          );
                        }),
                        MText(
                          text: context.localization?.welcomeBack,
                          fontFamily: foontFamily.tajawalBold,
                          fontColor: coolors.primaryColor,
                          fontSize: foontSize.font20,
                        ),
                      ],
                    ),
                  ],
                ).mPadding(vertical: spaces.space50),
                OfficerDrawerItem(
                  icon: svgs.home,
                  title: context.localization?.home,
                  onTap: () => context.pop(),
                ),
                OfficerDrawerItem(
                  icon: svgs.person,
                  title: context.localization?.myProfile,
                  onTap: () => context.push(const MyProfileScreen()),
                ),
                Consumer(builder: (context, ref, child) {
                  final controller = ref.watch(drawerController);
                  return OfficerDrawerItem(
                    count: controller.unReadCount.toString(),
                    icon: svgs.notification,
                    title: context.localization?.notifications,
                    onTap: () =>
                        context.push(const OfficerNotificationScreen()),
                  );
                }),
                OfficerDrawerItem(
                  icon: svgs.job,
                  title: context.localization?.myApplications,
                  onTap: () => context.push(const MyApplicationScreen()),
                ),
                OfficerDrawerItem(
                  icon: svgs.saved,
                  title: context.localization?.saved,
                  onTap: () => context.push(const SavedScreen()),
                ),
                OfficerDrawerItem(
                  icon: svgs.settings,
                  title: context.localization?.settings,
                  onTap: () => context.push(OfficerSettingsScreen()),
                ),
                OfficerDrawerItem(
                  icon: svgs.logout,
                  title: context.localization?.logOut,
                  onTap: () => localSavingData.logOut(context),
                ),
                MText(
                  text: context.localization?.followUs,
                  fontSize: foontSize.font16,
                  fontFamily: foontFamily.tajawalRegular,
                ).mPadding(vertical: spaces.space12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MIconButton(
                      icon: svgs.facebook,
                      onTap: () {},
                    ),
                    MIconButton(
                      icon: svgs.instgram,
                      onTap: () {},
                    ).mPadding(horizontal: spaces.space21),
                    MIconButton(
                      icon: svgs.twitter,
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
