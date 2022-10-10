// ignore_for_file: file_names

import 'package:tawzeef/controller/consts/exports.dart';

class ChooseLanguageScreen extends StatelessWidget {
  ChooseLanguageScreen({Key? key}) : super(key: key) {
    localSavingData.chooseLanguageOpened();
  }
  final ChangeNotifierProvider<SettingsScreenModel> settingsController =
      ChangeNotifierProvider<SettingsScreenModel>((ref) => settings);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: coolors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: MSvg(
                  name: svgs.world,
                  height: 320,
                ),
              ).mPadding(
                top: spaces.space101,
                bottom: spaces.space71,
              ),
              MText(
                text: context.localization?.choosePreferredLanguage,
                fontColor: coolors.white,
                fontSize: foontSize.font26,
                fontFamily: foontFamily.tajawalBold,
              ).mPadding(
                bottom: spaces.space30,
              ),
              Consumer(builder: (context, ref, child) {
                final controller = ref.watch(settingsController);
                return MBouncingButton(
                  icon: svgs.english,
                  onTap: () {
                    controller.chooseLanguage(context: context, lang: 'en');
                  },
                  title: context.localization?.english,
                  width: 280,
                  height: 65,
                  color: coolors.white,
                  textColor: coolors.primaryColor,
                  borderRadius: 50,
                  iconTransparent: true,
                ).mPadding(bottom: spaces.space30);
              }),
              Consumer(builder: (context, ref, child) {
                final controller = ref.watch(settingsController);
                return MBouncingButton(
                  icon: svgs.arabic,
                  onTap: () {
                    controller.chooseLanguage(context: context, lang: 'ar');
                  },
                  title: context.localization?.arabic,
                  width: 280,
                  height: 65,
                  color: coolors.white,
                  textColor: coolors.primaryColor,
                  iconTransparent: true,
                  borderRadius: 50,
                ).mPadding(bottom: spaces.space30);
              })
            ],
          ),
        ),
      ),
    );
  }
}
