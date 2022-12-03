import 'package:tawzeef/shared/consts/exports.dart';
import 'widgets/company_or_pharmacy_drawer_item.dart';

class CompanyOrPharmacyDrawerScreen extends StatefulWidget {
  const CompanyOrPharmacyDrawerScreen({Key? key}) : super(key: key);

  @override
  State<CompanyOrPharmacyDrawerScreen> createState() =>
      _CompanyOrPharmacyDrawerScreenState();
}

class _CompanyOrPharmacyDrawerScreenState
    extends State<CompanyOrPharmacyDrawerScreen> {
  late AutoDisposeChangeNotifierProvider<CompanyOrPharnamcyDrawerScreenModel>
      drawerController =
      AutoDisposeChangeNotifierProvider<CompanyOrPharnamcyDrawerScreenModel>(
          (ref) => CompanyOrPharnamcyDrawerScreenModel(context));

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
                      onTap: () =>
                          context.push(const MyCompanyOrPharmacyScreen()),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer(builder: (context, ref, child) {
                          final controller = ref.watch(
                              ChangeNotifierProvider((ref) => localSavingData));
                          return MText(
                            text:
                                "${context.localization?.hi}, ${controller.logUser.name}",
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
                CompanyOrPharmacyDrawerItem(
                  icon: svgs.home,
                  title: context.localization?.home,
                  onTap: () => context.pop(),
                ),
                CompanyOrPharmacyDrawerItem(
                  icon: svgs.person,
                  title: context.localization?.myCompany,
                  onTap: () => context.push(const MyCompanyOrPharmacyScreen()),
                ),
                Consumer(builder: (context, ref, child) {
                  final controller = ref.watch(drawerController);
                  return CompanyOrPharmacyDrawerItem(
                    count: controller.unReadCount.toString(),
                    icon: svgs.notification,
                    title: context.localization?.notifications,
                    onTap: () => context
                        .push(const CompanyOrPharmacyNotificationScreen()),
                  );
                }),
                CompanyOrPharmacyDrawerItem(
                  icon: svgs.job,
                  title: context.localization?.myJob,
                  onTap: () => context.push(const MyJobsScreen()),
                ),
                CompanyOrPharmacyDrawerItem(
                  icon: svgs.settings,
                  title: context.localization?.settings,
                  onTap: () => context.push(CompanyOrPharmacySettingsScreen()),
                ),
                CompanyOrPharmacyDrawerItem(
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
