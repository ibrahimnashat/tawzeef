import 'package:tawzeef/shared/consts/exports.dart';

class CompanyOrPharmacyScreen extends StatelessWidget {
  final JobModel job;
  const CompanyOrPharmacyScreen({Key? key, required this.job})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: coolors.primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            PositionedDirectional(
              end: -110,
              top: -40,
              child: MSvg(
                name: svgs.circle,
                width: 400,
                height: 400,
              ),
            ),
            PositionedDirectional(
              top: 100,
              end: 0,
              start: 0,
              bottom: 0,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 170,
                      child: Stack(
                        children: [
                          PositionedDirectional(
                            end: 0,
                            start: 0,
                            top: 70,
                            bottom: 0,
                            child: Container(
                              color: coolors.white,
                            ),
                          ),
                          PositionedDirectional(
                            top: 0,
                            start: spaces.space24,
                            end: spaces.space24,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    MSvg(
                                      name: svgs.back,
                                      height: 30,
                                      width: 30,
                                    )
                                        .mFlap
                                        .mPadding(
                                          end: spaces.space21,
                                          bottom: spaces.space8,
                                          top: spaces.space41,
                                        )
                                        .mAddAction(onTap: () => context.pop()),
                                    Container(
                                      padding: EdgeInsets.all(spaces.space5),
                                      decoration: BoxDecoration(
                                        color: coolors.primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: MNetworkImage(
                                        url: job.jobCompany?.logo ?? '',
                                        fit: BoxFit.cover,
                                        borderRadius: 100,
                                        height: 150,
                                        width: 150,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: spaces.space24),
                      width: context.w,
                      constraints: const BoxConstraints(maxHeight: 750),
                      decoration: BoxDecoration(color: coolors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MText(
                            text: job.jobCompany?.name,
                            fontSize: foontSize.font24,
                            fontFamily: foontFamily.tajawalBold,
                            fontColor: coolors.primaryColor,
                          ).mPadding(top: spaces.space12),
                          MText(
                            text:
                                '${job.jobCompany?.city?.city} | ${job.jobCompany?.state?.state} | ${job.jobCompany?.country?.country}',
                            fontSize: foontSize.font16,
                            fontFamily: foontFamily.tajawalRegular,
                          ),
                          const Divider().mPadding(top: spaces.space12),
                          MText(
                            text: context.localization?.aboutCompany,
                            fontFamily: foontFamily.tajawalBold,
                            fontSize: foontSize.font22,
                            fontColor: coolors.primaryColor,
                          ),
                          MText(
                            text: job.jobCompany?.description,
                            fontSize: foontSize.font18,
                            maxWidth: context.w * 0.9,
                            maxLines: 10,
                          ).mPadding(vertical: spaces.space12),
                          MText(
                            text: context.localization?.noOfEmployees,
                            fontFamily: foontFamily.tajawalBold,
                            fontSize: foontSize.font22,
                            fontColor: coolors.primaryColor,
                          ),
                          MText(
                            text: job.jobCompany?.noOfEmployees,
                            fontSize: foontSize.font18,
                            maxWidth: context.w * 0.9,
                            maxLines: 10,
                          ).mPadding(vertical: spaces.space12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              MSvg(
                                name: svgs.job,
                              ).mPadding(
                                end: spaces.space12,
                                bottom: spaces.space5,
                              ),
                              MText(
                                text: context.localization?.location,
                                fontColor: coolors.primaryColor,
                                fontFamily: foontFamily.tajawalBold,
                                fontSize: foontSize.font22,
                              ),
                            ],
                          ),
                          MText(
                            text:
                                '${job.jobCompany?.city?.city}, ${job.jobCompany?.state?.state}, ${job.jobCompany?.country?.country}',
                            fontSize: foontSize.font18,
                            maxWidth: context.w * 0.9,
                            maxLines: 10,
                          ).mPadding(vertical: spaces.space12),
                          MText(
                            text: context.localization?.socialMedia,
                            fontColor: coolors.primaryColor,
                            fontFamily: foontFamily.tajawalBold,
                            fontSize: foontSize.font22,
                          ).mPadding(
                            bottom: spaces.space24,
                            top: spaces.space50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MIconButton(
                                icon: svgs.website,
                                onTap: () => urlLauncher.openUrl(
                                  context: context,
                                  url: job.jobCompany?.website,
                                ),
                                iconColor: coolors.blue,
                              ).mPadding(horizontal: spaces.space21),
                              MIconButton(
                                icon: svgs.linkedin,
                                onTap: () => urlLauncher.openUrl(
                                  context: context,
                                  url: job.jobCompany?.linkedin,
                                ),
                                iconColor: coolors.blue,
                              ),
                              MIconButton(
                                icon: svgs.facebook,
                                onTap: () => urlLauncher.openUrl(
                                  context: context,
                                  url: job.jobCompany?.facebook,
                                ),
                                iconColor: coolors.blue,
                              ).mPadding(horizontal: spaces.space21),
                              MIconButton(
                                icon: svgs.twitter,
                                onTap: () => urlLauncher.openUrl(
                                  context: context,
                                  url: job.jobCompany?.twitter,
                                ),
                                iconColor: coolors.blue,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
