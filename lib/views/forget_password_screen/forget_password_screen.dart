import 'package:tawzeef/shared/consts/exports.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  final AutoDisposeChangeNotifierProvider<ForgetPasswordScreenModel>
      forgetPasswordScreenController =
      AutoDisposeChangeNotifierProvider<ForgetPasswordScreenModel>(
          (ref) => ForgetPasswordScreenModel());
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
                    Row(
                      children: [
                        MSvg(
                          name: svgs.back,
                        )
                            .mPadding(
                              end: spaces.space21,
                              bottom: spaces.space8,
                            )
                            .mAddAction(onTap: () => context.pop()),
                        MText(
                          text: context.localization?.confirmEmail,
                          fontColor: coolors.primaryColor,
                          fontFamily: foontFamily.tajawalBold,
                          fontSize: foontSize.font30,
                        ),
                      ],
                    ).mPadding(bottom: spaces.space24),
                    Consumer(builder: (context, ref, child) {
                      final controller =
                          ref.watch(forgetPasswordScreenController);
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
                          width: 20,
                          height: 20,
                        ),
                      ).mPadding(vertical: spaces.space86);
                    }),
                    Consumer(builder: (context, ref, child) {
                      final controller =
                          ref.watch(forgetPasswordScreenController);
                      return MBouncingButton(
                        title: context.localization?.continuue,
                        color: coolors.primaryColor,
                        onTap: () => controller.forgetPassword(context),
                      );
                    }),
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
