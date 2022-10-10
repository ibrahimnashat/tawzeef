import 'package:tawzeef/controller/consts/exports.dart';
import 'widgets/company_drawer_item.dart';

class CompanyDrawerScreen extends StatefulWidget {
  const CompanyDrawerScreen({Key? key}) : super(key: key);

  @override
  State<CompanyDrawerScreen> createState() => _CompanyDrawerScreenState();
}

class _CompanyDrawerScreenState extends State<CompanyDrawerScreen> {
  late AutoDisposeChangeNotifierProvider<CompanyDrawerScreenModel>
      drawerController =
      AutoDisposeChangeNotifierProvider<CompanyDrawerScreenModel>(
          (ref) => CompanyDrawerScreenModel(context));

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      width: context.w * 0.8,
      backgroundColor: Colors.transparent,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsetsDirectional.only(top: 225),
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
                      onTap: () => context.push(const MyCompanyScreen()),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MText(
                          text: "${context.localization?.hi} ,",
                          fontFamily: foontFamily.tajawalBold,
                          fontColor: coolors.primaryColor,
                          fontSize: foontSize.font20,
                        ),
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
                CompanyDrawerItem(
                  icon: svgs.home,
                  title: context.localization?.home,
                  onTap: () => context.pop(),
                ),
                CompanyDrawerItem(
                  icon: svgs.person,
                  title: context.localization?.myCompany,
                  onTap: () => context.push(const MyCompanyScreen()),
                ),
                Consumer(builder: (context, ref, child) {
                  final controller = ref.watch(drawerController);
                  return CompanyDrawerItem(
                    count: controller.unReadCount.toString(),
                    icon: svgs.notification,
                    title: context.localization?.notifications,
                    onTap: () =>
                        context.push(const CompanyNotificationScreen()),
                  );
                }),
                CompanyDrawerItem(
                  icon: svgs.job,
                  title: context.localization?.myJob,
                  onTap: () => context.push(const MyJobsScreen()),
                ),
                CompanyDrawerItem(
                  icon: svgs.settings,
                  title: context.localization?.settings,
                  onTap: () => context.push(CompanySettingsScreen()),
                ),
                CompanyDrawerItem(
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
