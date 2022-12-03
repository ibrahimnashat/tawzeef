import 'package:tawzeef/shared/consts/exports.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final AutoDisposeChangeNotifierProvider<RegisterScreenModel>
      registerScreenController =
      AutoDisposeChangeNotifierProvider<RegisterScreenModel>(
          (ref) => RegisterScreenModel());
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
                name: pngs.hello,
                width: 400,
                fit: BoxFit.contain,
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
                    Column(
                      children: [
                        MText(
                          text: context.localization?.signUp,
                          fontColor: coolors.primaryColor,
                          fontFamily: foontFamily.tajawalBold,
                          fontSize: foontSize.font38,
                        ).mPadding(bottom: spaces.space24),
                        Consumer(builder: (context, ref, child) {
                          final controller =
                              ref.watch(registerScreenController);
                          return MTextFiled(
                            controller: controller.name,
                            lableText: context.localization?.name,
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
                          final controller =
                              ref.watch(registerScreenController);
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
                          final controller =
                              ref.watch(registerScreenController);
                          return MTextFiled(
                            controller: controller.phone,
                            lableText: context.localization?.phone,
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
                          final controller =
                              ref.watch(registerScreenController);
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
                        Consumer(builder: (context, ref, child) {
                          final controller =
                              ref.watch(registerScreenController);
                          return MBouncingButton(
                            onTap: () => controller.register(context),
                            title: context.localization?.getStarted,
                            color: coolors.primaryColor,
                          ).mPadding(top: spaces.space50);
                        }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MText(
                              text: context.localization?.haveAnAcount,
                              fontColor: coolors.primaryColor,
                              fontSize: foontSize.font20,
                            ).mPadding(end: spaces.space8),
                            MText(
                              text: context.localization?.login,
                              fontSize: foontSize.font20,
                              fontFamily: foontFamily.tajawalBold,
                              fontColor: coolors.primaryColor,
                            ).mAddAction(
                                onTap: () =>
                                    context.pushAndRemoveUntil(LoginScreen()))
                          ],
                        ).mPadding(all: spaces.space24)
                      ],
                    ),
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
