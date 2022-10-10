import 'package:tawzeef/controller/consts/exports.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final AutoDisposeChangeNotifierProvider<LoginScreenModel> loginController =
      AutoDisposeChangeNotifierProvider<LoginScreenModel>(
          (res) => LoginScreenModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: coolors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              MAssetImage(
                name: pngs.login,
                width: context.w,
                fit: BoxFit.fitWidth,
                height: 220,
              ).mPadding(all: spaces.space21),
              Container(
                height: 750,
                decoration: BoxDecoration(
                  color: coolors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(35),
                  ),
                ),
                padding: EdgeInsets.all(spaces.space24),
                child: Column(
                  children: [
                    MText(
                      text: context.localization?.login,
                      fontColor: coolors.primaryColor,
                      fontFamily: foontFamily.tajawalBold,
                      fontSize: foontSize.font38,
                    ).mPadding(bottom: spaces.space24),
                    Consumer(builder: (context, ref, child) {
                      final controller = ref.read(loginController);
                      return MTextFiled(
                        controller: controller.email,
                        lableText: context.localization?.email,
                        textColor: coolors.primaryColor,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: coolors.primaryColor,
                            style: BorderStyle.solid,
                            width: 0.70,
                          ),
                        ),
                        suffix: MSvg(
                          name: svgs.correctCheck,
                        ),
                      ).mPadding(bottom: spaces.space24);
                    }),
                    Consumer(builder: (context, ref, child) {
                      final controller = ref.read(loginController);
                      return MTextFiled(
                        controller: controller.password,
                        lableText: context.localization?.password,
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
                      );
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MText(
                          text: context.localization?.needHelp,
                          fontColor: coolors.primaryColor,
                          fontSize: foontSize.font20,
                        ).mAddAction(
                          onTap: () => context.push(ForgetPasswordScreen()),
                        )
                      ],
                    ).mPadding(bottom: spaces.space21, top: spaces.space30),
                    Consumer(builder: (context, ref, child) {
                      final controller = ref.watch(loginController);
                      return MBouncingButton(
                        title: context.localization?.login,
                        color: coolors.primaryColor,
                        onTap: () => controller.login(context),
                      );
                    }),
                    MText(
                      text: context.localization?.forgetPassword,
                      fontColor: coolors.primaryColor,
                      fontSize: foontSize.font20,
                    )
                        .mAddAction(
                          onTap: () => context.push(ForgetPasswordScreen()),
                        )
                        .mPadding(vertical: spaces.space21),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MText(
                          text: context.localization?.newable,
                          fontColor: coolors.primaryColor,
                          fontSize: foontSize.font20,
                        ).mPadding(end: spaces.space8),
                        MText(
                          text: context.localization?.createAccount,
                          fontSize: foontSize.font20,
                          fontFamily: foontFamily.tajawalBold,
                          fontColor: coolors.primaryColor,
                        ).mAddAction(onTap: () => context.push(SignUpScreen()))
                      ],
                    ).mPadding(
                      horizontal: spaces.space21,
                      top: spaces.space35,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
