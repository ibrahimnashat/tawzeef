import 'package:tawzeef/controller/consts/exports.dart';

import 'widgets/my_job_item.dart';

class MyJobsScreen extends StatefulWidget {
  const MyJobsScreen({Key? key}) : super(key: key);

  @override
  State<MyJobsScreen> createState() => _MyJobsScreenState();
}

class _MyJobsScreenState extends State<MyJobsScreen> {
  late AutoDisposeChangeNotifierProvider<MyJobScreenModel> myJobController =
      AutoDisposeChangeNotifierProvider<MyJobScreenModel>(
          (ref) => MyJobScreenModel(context));

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
                      text: context.localization?.myJob,
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
        padding: EdgeInsets.only(top: spaces.space30),
        child: Consumer(builder: (context, ref, child) {
          final controller = ref.watch(myJobController);
          if (controller.isLoading) {
            return Loader.loading();
          } else if (controller.jobs.isEmpty) {
            return Loader.empty();
          }
          return Column(
            children: controller.jobs
                .map(
                  (e) => MyJobItem(
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
