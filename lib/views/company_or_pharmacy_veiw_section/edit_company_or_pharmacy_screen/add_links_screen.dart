import 'package:tawzeef/shared/consts/exports.dart';

class AddLinksScreen extends StatefulWidget {
  const AddLinksScreen({Key? key}) : super(key: key);

  @override
  State<AddLinksScreen> createState() => _AddLinksScreenState();
}

class _AddLinksScreenState extends State<AddLinksScreen> {
  late AutoDisposeChangeNotifierProvider<EditMyCompanyOrPharnamcyScreenModel>
      editCompanyController =
      AutoDisposeChangeNotifierProvider<EditMyCompanyOrPharnamcyScreenModel>(
          (ref) => EditMyCompanyOrPharnamcyScreenModel(context));

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
                      name: svgs.job,
                      color: coolors.primaryColor,
                    ).mPadding(end: spaces.space12),
                    MText(
                      text: context.localization?.addLinks,
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
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: spaces.space21),
              child: Column(
                children: [
                  Consumer(builder: (context, ref, child) {
                    final controller = ref.watch(editCompanyController);
                    return MTextFiled(
                      controller: controller.website,
                      hintText: localStorage.logUser.website,
                      lableText: context.localization?.website,
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
                    ).mPadding(bottom: spaces.space30);
                  }),
                  Consumer(builder: (context, ref, child) {
                    final controller = ref.watch(editCompanyController);
                    return MTextFiled(
                      controller: controller.linkedin,
                      hintText: localStorage.logUser.linkedin,
                      lableText: context.localization?.linkedin,
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
                    ).mPadding(bottom: spaces.space30);
                  }),
                  Consumer(builder: (context, ref, child) {
                    final controller = ref.watch(editCompanyController);
                    return MTextFiled(
                      controller: controller.facebook,
                      hintText: localStorage.logUser.facebook,
                      lableText: context.localization?.facebook,
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
                    ).mPadding(bottom: spaces.space30);
                  }),
                  Consumer(builder: (context, ref, child) {
                    final controller = ref.watch(editCompanyController);
                    return MTextFiled(
                      controller: controller.twitter,
                      hintText: localStorage.logUser.twitter,
                      lableText: context.localization?.twitter,
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
                    ).mPadding(bottom: spaces.space30);
                  }),
                ],
              ),
            ),
          ),
          Consumer(builder: (context, ref, child) {
            final controller = ref.watch(editCompanyController);
            return MBouncingButton(
              title: context.localization?.save,
              color: coolors.primaryColor,
              onTap: () =>
                  controller.editCompanyProfile(context, () => context.pop()),
            );
          }),
        ],
      ).mPadding(
        horizontal: spaces.space24,
        vertical: spaces.space21,
      ),
    );
  }
}
