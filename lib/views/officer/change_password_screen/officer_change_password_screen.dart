import 'package:tawzeef/controller/consts/exports.dart';

class OfficerChangePasswordScreen extends StatelessWidget {
  OfficerChangePasswordScreen({Key? key}) : super(key: key);
  final AutoDisposeChangeNotifierProvider<ChangePasswordScreenModel>
      changePasswordScreenController =
      AutoDisposeChangeNotifierProvider<ChangePasswordScreenModel>(
          (ref) => ChangePasswordScreenModel());
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
                      name: svgs.person,
                      color: coolors.primaryColor,
                      width: 32,
                      height: 32,
                    ).mPadding(end: spaces.space12),
                    MText(
                      text: context.localization?.changePassword,
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          vertical: spaces.space21,
          horizontal: spaces.space24,
        ),
        child: Column(
          children: [
            Consumer(builder: (context, ref, child) {
              final controller = ref.watch(changePasswordScreenController);
              return MTextFiled(
                controller: controller.password,
                lableText: context.localization?.newPassword,
                textColor: coolors.primaryColor,
                obscureText: true,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: coolors.primaryColor,
                    style: BorderStyle.solid,
                    width: 0.70,
                  ),
                ),
                suffix: MSvg(
                  name: svgs.password,
                ),
              ).mPadding(vertical: spaces.space30);
            }),
            Consumer(builder: (context, ref, child) {
              final controller = ref.watch(changePasswordScreenController);
              return MTextFiled(
                controller: controller.confirmPassword,
                lableText: context.localization?.confirmPassword,
                textColor: coolors.primaryColor,
                obscureText: true,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: coolors.primaryColor,
                    style: BorderStyle.solid,
                    width: 0.70,
                  ),
                ),
                suffix: MSvg(
                  name: svgs.password,
                ),
              ).mPadding(bottom: spaces.space30);
            }),
            Consumer(builder: (context, ref, child) {
              final controller = ref.watch(changePasswordScreenController);
              return MBouncingButton(
                title: context.localization?.save,
                color: coolors.primaryColor,
                onTap: () => controller.changePassword(context),
              ).mPadding(vertical: spaces.space101);
            }),
          ],
        ),
      ),
    );
  }
}
