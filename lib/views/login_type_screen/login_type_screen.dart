import 'package:tawzeef/shared/consts/exports.dart';

class LoginTypeScreen extends StatelessWidget {
  LoginTypeScreen({Key? key}) : super(key: key);
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
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Consumer(builder: (context, ref, child) {
                  final controller = ref.watch(settingsController);
                  controller.loading(context);
                  return Container(
                    margin: EdgeInsets.all(spaces.space21),
                    padding: EdgeInsets.symmetric(horizontal: spaces.space12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: MDropDown<dynamic>(
                      setInitial: controller.inital,
                      removeBorder: true,
                      isExpanded: false,
                      itemTitle: (res) => res['name'],
                      onChanged: (res) {
                        controller.chooseLanguage(
                            context: context, lang: res['value']);
                      },
                      options: controller.options,
                    ),
                  );
                }),
              ),
              MAssetImage(
                name: pngs.welcome,
                width: context.w,
                fit: BoxFit.cover,
                height: 450,
              ),
              MBouncingButton(
                icon: svgs.person,
                onTap: () => loginType.setPharmacistUserType(context),
                title: context.localization?.pharmacist,
                width: 280,
                height: 65,
                color: coolors.white,
                textColor: coolors.primaryColor,
                borderRadius: 50,
              ).mPadding(bottom: spaces.space30),
              MBouncingButton(
                icon: svgs.pharmacy,
                onTap: () => loginType.setPharmacyUserType(context),
                title: context.localization?.pharmacy,
                width: 280,
                height: 65,
                color: coolors.white,
                textColor: coolors.primaryColor,
                borderRadius: 50,
              ).mPadding(bottom: spaces.space30),
              MBouncingButton(
                borderRadius: 50,
                icon: svgs.company,
                onTap: () => loginType.setCompanyUserType(context),
                title: context.localization?.company,
                width: 280,
                height: 65,
                color: coolors.white,
                textColor: coolors.primaryColor,
              ).mPadding(bottom: spaces.space30),
            ],
          ),
        ),
      ),
    );
  }
}
