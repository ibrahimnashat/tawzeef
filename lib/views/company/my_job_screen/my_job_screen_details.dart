import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/objects/job_model.dart';

import 'widgets/menu_item.dart';

class MyJobScreenDetailsScreen extends StatelessWidget {
  final JobModel job;
  const MyJobScreenDetailsScreen({
    Key? key,
    required this.job,
  }) : super(key: key);

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        MSvg(
                          name: svgs.back,
                          color: coolors.white,
                          height: 30,
                          width: 30,
                        ).mFlap.mAddAction(
                              onTap: () => context.pop(),
                            ),
                        MText(
                          text: context.localization?.jobDetails,
                          fontColor: coolors.white,
                          fontFamily: foontFamily.tajawalBold,
                          fontSize: foontSize.font22,
                        ).mPadding(
                          start: spaces.space21,
                        ),
                      ],
                    ),
                    PopMenuItem(
                      iconColor: coolors.white,
                      onEdit: () => context.push(
                        AddJobScreen(
                          job: job,
                        ),
                      ),
                    )
                  ],
                ).mPadding(
                  horizontal: spaces.space21,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              MNetworkImage(
                url: job.jobCompany?.logo ?? '',
                fit: BoxFit.cover,
                borderRadius: 100,
                height: 90,
                width: 90,
              ).mPadding(end: spaces.space12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MText(
                    text: job.jobTitle?.title,
                    fontSize: foontSize.font26,
                    fontColor: coolors.white,
                    fontFamily: foontFamily.tajawalBold,
                  ),
                  MText(
                    text:
                        "${job.state?.state} - ${job.city?.city} | ${job.jobType?.jobtype}",
                    fontSize: foontSize.font20,
                    fontColor: coolors.white,
                    maxLines: 2,
                    maxWidth: context.w * 0.68,
                  ),
                ],
              )
            ],
          ).mPadding(horizontal: spaces.space24, bottom: spaces.space21),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(spaces.space30),
              decoration: BoxDecoration(
                color: coolors.white,
                borderRadius: const BorderRadiusDirectional.vertical(
                    top: Radius.circular(50)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MText(
                                    text: "10",
                                    fontSize: foontSize.font32,
                                    fontColor: coolors.primaryColor,
                                    fontFamily: foontFamily.tajawalBold,
                                  ),
                                  SizedBox(
                                    width: 20,
                                    height: 30,
                                    child: VerticalDivider(
                                      color: coolors.primaryColor,
                                    ),
                                  ).mPadding(bottom: spaces.space12),
                                  MText(
                                    text:
                                        context.localization?.appliedForThisJob,
                                    fontSize: foontSize.font16,
                                    fontColor: coolors.halfBlack,
                                    maxWidth: 80,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  MText(
                                    text: (job.view ?? 0).toString(),
                                    fontSize: foontSize.font32,
                                    fontColor: coolors.primaryColor,
                                    fontFamily: foontFamily.tajawalBold,
                                  ),
                                  SizedBox(
                                    width: 20,
                                    height: 30,
                                    child: VerticalDivider(
                                      color: coolors.primaryColor,
                                    ),
                                  ).mPadding(bottom: spaces.space12),
                                  MText(
                                    text: context.localization?.views,
                                    fontSize: foontSize.font16,
                                    fontColor: coolors.halfBlack,
                                    maxWidth: 80,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MSvg(
                                name: svgs.saveCheck,
                              ).mPadding(end: spaces.space12),
                              MText(
                                text:
                                    "${job.jobCompany?.name} | ${job.state?.state} - ${job.city?.city}",
                                textDecoration: TextDecoration.underline,
                                fontColor: coolors.primaryColor,
                                fontFamily: foontFamily.tajawalBold,
                                fontSize: foontSize.font26,
                                maxLines: 2,
                                maxWidth: context.w * 0.8,
                              )
                            ],
                          ).mPadding(vertical: spaces.space12),
                          MText(
                            text: "${context.localization?.jobDetails} :",
                            fontFamily: foontFamily.tajawalBold,
                            fontSize: foontSize.font22,
                          ),
                          MText(
                            text: job.jobDescription,
                            fontSize: foontSize.font18,
                            maxWidth: context.w * 0.9,
                            maxLines: 10,
                          ).mPadding(vertical: spaces.space12),
                          MText(
                            text: "${context.localization?.careerLevel}:",
                            fontFamily: foontFamily.tajawalBold,
                            fontSize: foontSize.font22,
                          ),
                          MText(
                            text: job.careerLevel!.career,
                            fontSize: foontSize.font18,
                            maxWidth: context.w * 0.9,
                            maxLines: 10,
                          ).mPadding(vertical: spaces.space12),
                          MText(
                            text: "${context.localization?.salary}:",
                            fontFamily: foontFamily.tajawalBold,
                            fontSize: foontSize.font22,
                          ),
                          MText(
                            text: job.salary.toString(),
                            fontSize: foontSize.font18,
                            maxWidth: context.w * 0.9,
                            maxLines: 10,
                          ).mPadding(vertical: spaces.space12),
                          MText(
                            text: "${context.localization?.yearOfExperience}:",
                            fontFamily: foontFamily.tajawalBold,
                            fontSize: foontSize.font22,
                          ),
                          MText(
                            text: job.jobExperience!.jobexperience,
                            fontSize: foontSize.font18,
                            maxWidth: context.w * 0.9,
                            maxLines: 10,
                          ).mPadding(vertical: spaces.space12),
                          MText(
                            text: "${context.localization?.jobShift}:",
                            fontFamily: foontFamily.tajawalBold,
                            fontSize: foontSize.font22,
                          ),
                          MText(
                            text: job.jobShift?.jobshift,
                            fontSize: foontSize.font18,
                            maxWidth: context.w * 0.9,
                            maxLines: 10,
                          ).mPadding(vertical: spaces.space12),
                          MText(
                            text: "${context.localization?.numberOfOfficer}:",
                            fontFamily: foontFamily.tajawalBold,
                            fontSize: foontSize.font22,
                          ),
                          MText(
                            text: job.position.toString(),
                            fontSize: foontSize.font18,
                            maxWidth: context.w * 0.9,
                            maxLines: 10,
                          ).mPadding(
                              top: spaces.space12, bottom: spaces.space35),
                        ],
                      ),
                    ),
                  ),
                  MBouncingButton(
                    title: context.localization?.editJob,
                    color: coolors.primaryColor,
                    onTap: () => context.push(
                      AddJobScreen(
                        job: job,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
