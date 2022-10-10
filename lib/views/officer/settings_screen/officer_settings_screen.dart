import 'package:tawzeef/controller/consts/exports.dart';

class OfficerSettingsScreen extends StatelessWidget {
  OfficerSettingsScreen({Key? key}) : super(key: key);
  final ChangeNotifierProvider<SettingsScreenModel> settingsController =
      ChangeNotifierProvider<SettingsScreenModel>((ref) => settings);
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
                      name: svgs.settings,
                      color: coolors.primaryColor,
                      width: 32,
                      height: 32,
                    ).mPadding(end: spaces.space12),
                    MText(
                      text: context.localization?.settings,
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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MText(
                text: context.localization?.changePassword,
                fontFamily: foontFamily.tajawalBold,
                fontColor: coolors.primaryColor,
              ),
              MSvg(
                name: svgs.back,
              ).mFlapEn
            ],
          ).mPadding(vertical: spaces.space21).mAddAction(
                onTap: () => context.push(OfficerChangePasswordScreen()),
              ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MText(
                text: context.localization?.chooseLanguage,
                fontFamily: foontFamily.tajawalBold,
                fontColor: coolors.primaryColor,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spaces.space24),
                decoration: BoxDecoration(
                  border: Border.all(color: coolors.primaryColor),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Consumer(builder: (context, ref, child) {
                  final controller = ref.watch(settingsController);
                  controller.loading(context);
                  return MDropDown<dynamic>(
                    setInitial: controller.inital,
                    removeBorder: true,
                    isExpanded: false,
                    itemTitle: (res) => res['name'],
                    onChanged: (res) {
                      controller.changeLanguage(
                          context: context, lang: res['value']);
                    },
                    options: controller.options,
                  );
                }),
              ),
            ],
          ).mPadding(vertical: spaces.space21),
          const Divider(),
        ],
      ).mPadding(
        horizontal: spaces.space24,
        vertical: spaces.space21,
      ),
    );
  }
}
