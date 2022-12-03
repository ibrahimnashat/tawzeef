import 'package:tawzeef/shared/consts/exports.dart';

class LoginTypeScreen extends StatelessWidget {
  const LoginTypeScreen({Key? key}) : super(key: key);

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
              MAssetImage(
                name: pngs.welcome,
                width: context.w,
                fit: BoxFit.cover,
                height: 500,
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
