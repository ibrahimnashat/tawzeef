import 'package:tawzeef/shared/consts/exports.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String apiToken;
  ResetPasswordScreen({Key? key, required this.apiToken}) : super(key: key);
  final AutoDisposeChangeNotifierProvider<ResetPasswordScreenModel>
      resetPasswordScreenController =
      AutoDisposeChangeNotifierProvider<ResetPasswordScreenModel>(
          (ref) => ResetPasswordScreenModel());
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
                          text: context.localization?.resetPassword,
                          fontColor: coolors.primaryColor,
                          fontFamily: foontFamily.tajawalBold,
                          fontSize: foontSize.font30,
                        ),
                      ],
                    ).mPadding(bottom: spaces.space24),
                    Consumer(builder: (context, ref, child) {
                      final controller =
                          ref.watch(resetPasswordScreenController);
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
                      final controller =
                          ref.watch(resetPasswordScreenController);
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
                      final controller =
                          ref.watch(resetPasswordScreenController);
                      return MBouncingButton(
                        title: context.localization?.continuue,
                        color: coolors.primaryColor,
                        onTap: () => controller.resetPassword(context,
                            apiToken: apiToken),
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
