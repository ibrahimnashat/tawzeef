import 'package:tawzeef/shared/consts/exports.dart';

import 'widgets/my_application_item.dart';

class MyApplicationScreen extends StatefulWidget {
  const MyApplicationScreen({Key? key}) : super(key: key);

  @override
  State<MyApplicationScreen> createState() => _MyApplicationScreenState();
}

class _MyApplicationScreenState extends State<MyApplicationScreen> {
  late AutoDisposeChangeNotifierProvider<ApplyingScreenModel>
      applyingScreenController =
      AutoDisposeChangeNotifierProvider<ApplyingScreenModel>(
          (ref) => ApplyingScreenModel(context));

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
                      width: 32,
                      height: 32,
                    ).mPadding(end: spaces.space12),
                    MText(
                      text: context.localization?.myApplications,
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
        padding: EdgeInsets.only(top: spaces.space21),
        child: Consumer(builder: (context, ref, child) {
          final controller = ref.watch(applyingScreenController);
          if (controller.isLoading) {
            return Loader.loading();
          } else if (controller.applyingJobs.isEmpty) {
            return Loader.empty();
          }
          return Column(
            children: controller.applyingJobs
                .map(
                  (e) => MyApplicationItem(
                    job: e,
                  ),
                )
                .toList(),
          );
        }),
      ),
    );
  }
}
