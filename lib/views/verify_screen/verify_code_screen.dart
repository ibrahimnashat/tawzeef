import 'package:tawzeef/shared/consts/exports.dart';

class VerifyCodeScreen extends StatelessWidget {
  final String? email;
  VerifyCodeScreen({Key? key, this.email}) : super(key: key);
  final AutoDisposeChangeNotifierProvider<VerifyCodeScreenModel>
      verifyCodeScreenController =
      AutoDisposeChangeNotifierProvider<VerifyCodeScreenModel>(
          (ref) => VerifyCodeScreenModel());
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
                    MAssetImage(
                      name: pngs.verifyCode,
                      width: 400,
                      fit: BoxFit.contain,
                      height: 200,
                    ),
                    MText(
                      text: context.localization?.verifcationCode,
                      fontFamily: foontFamily.tajawalBold,
                      fontColor: coolors.black,
                    ).mPadding(vertical: spaces.space24),
                    Consumer(builder: (context, ref, child) {
                      final controller = ref.watch(verifyCodeScreenController);
                      return PinCodeTextField(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        appContext: context,
                        length: 4,
                        obscureText: true,
                        obscuringCharacter: '#',
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 60,
                          fieldWidth: 60,
                          activeColor: coolors.primaryColor,
                          activeFillColor: coolors.white,
                          selectedColor: coolors.primaryColor,
                          selectedFillColor: coolors.white,
                          inactiveColor: coolors.grey,
                          inactiveFillColor: coolors.white,
                        ),
                        hintStyle: TextStyle(
                          fontSize: foontSize.font20,
                          color: coolors.grey,
                        ),
                        textStyle: TextStyle(
                          fontSize: foontSize.font20,
                          color: coolors.primaryColor,
                        ),
                        cursorColor: coolors.primaryColor,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        keyboardType: TextInputType.number,
                        onCompleted: (v) {
                          debugPrint("Completed");
                        },
                        onChanged: controller.setCode,
                        beforeTextPaste: (text) {
                          debugPrint("Allowing to paste $text");
                          return true;
                        },
                      ).mPadding(top: spaces.space24, bottom: spaces.space80);
                    }),
                    Consumer(builder: (context, ref, child) {
                      final controller = ref.watch(verifyCodeScreenController);
                      return MBouncingButton(
                        title: context.localization?.continuue,
                        color: coolors.primaryColor,
                        onTap: () => controller.verifyCode(context, email),
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
