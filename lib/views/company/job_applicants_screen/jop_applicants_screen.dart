import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/objects/job_model.dart';

import 'widget/applicant_item.dart';
import 'widget/option_item.dart';

class JobApplicantsScreen extends StatefulWidget {
  final JobModel job;
  const JobApplicantsScreen({
    Key? key,
    required this.job,
  }) : super(key: key);

  @override
  State<JobApplicantsScreen> createState() => _JobApplicantsScreenState();
}

class _JobApplicantsScreenState extends State<JobApplicantsScreen> {
  late AutoDisposeChangeNotifierProvider<JobApplicantsScreenModel>
      jobApplicantsController =
      AutoDisposeChangeNotifierProvider<JobApplicantsScreenModel>(
          (ref) => JobApplicantsScreenModel(context, widget.job.id ?? 0));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: coolors.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size(context.w, 90),
        child: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: MSvg(
                  name: svgs.back,
                  color: coolors.white,
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
                      name: svgs.correctCheck,
                      color: coolors.white,
                    ).mPadding(end: spaces.space12),
                    MText(
                      text: context.localization?.jobApplicants,
                      fontColor: coolors.white,
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
          SizedBox(
            height: 105,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: spaces.space21),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Consumer(builder: (context, ref, child) {
                final controller = ref.watch(jobApplicantsController);
                return Row(
                  children: controller.options
                      .asMap()
                      .entries
                      .map(
                        (e) => OptionItem(
                          title: e.value['name'],
                          selected: e.key == controller.index,
                          count: e.key == controller.index
                              ? controller.currentUsers.length.toString()
                              : null,
                        ).mAddAction(
                            onTap: () =>
                                controller.changeIndex(context, e.key)),
                      )
                      .toList(),
                );
              }),
            ),
          ),
          Expanded(
            child: Container(
              height: 820,
              padding: EdgeInsets.only(top: spaces.space30),
              decoration: BoxDecoration(
                color: coolors.white,
                borderRadius: const BorderRadiusDirectional.vertical(
                    top: Radius.circular(50)),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Consumer(builder: (context, ref, child) {
                  final controller = ref.watch(jobApplicantsController);
                  if (controller.isLoading) {
                    return Loader.loading();
                  } else if (controller.currentUsers.isEmpty) {
                    return Loader.empty();
                  }
                  return Column(
                    children: controller.currentUsers
                        .map(
                          (e) => JobApplicantItem(
                            user: e,
                            jobApplicantsController: jobApplicantsController,
                          ),
                        )
                        .toList(),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
