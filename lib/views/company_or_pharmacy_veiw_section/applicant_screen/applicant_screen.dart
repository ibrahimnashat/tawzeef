import 'package:tawzeef/shared/consts/exports.dart';

class ApplicantScreen extends StatelessWidget {
  final UserModel? user;
  const ApplicantScreen({
    Key? key,
    this.user,
  }) : super(key: key);

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
              top: 110,
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
                            child: Row(
                              children: [
                                MSvg(
                                  height: 30,
                                  width: 30,
                                  name: svgs.back,
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
                                    url: user?.image ?? '',
                                    fit: BoxFit.cover,
                                    borderRadius: 100,
                                    height: 150,
                                    width: 150,
                                  ),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MText(
                                text: user?.name,
                                fontSize: foontSize.font24,
                                fontFamily: foontFamily.tajawalBold,
                              ).mPadding(top: spaces.space12),
                              MText(
                                text: user?.education?.degreeType,
                                fontSize: foontSize.font18,
                                fontFamily: foontFamily.tajawalRegular,
                              ),
                              MText(
                                text: "${user?.phone} | ${user?.email}",
                                fontSize: foontSize.font16,
                                fontFamily: foontFamily.tajawalRegular,
                              ),
                              MText(
                                text:
                                    "${user?.state?.state}, ${user?.country?.country}",
                                fontSize: foontSize.font16,
                                fontFamily: foontFamily.tajawalRegular,
                              ),
                            ],
                          ),
                          const Divider().mPadding(top: spaces.space12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MSvg(
                                name: svgs.education,
                              ).mPadding(end: spaces.space24),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MText(
                                    text: context.localization?.education,
                                    fontSize: foontSize.font22,
                                    fontFamily: foontFamily.tajawalBold,
                                    fontColor: coolors.primaryColor,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MText(
                                        text: user?.education?.university,
                                        fontSize: foontSize.font16,
                                        fontFamily: foontFamily.tajawalRegular,
                                      ),
                                      MText(
                                        text:
                                            "${user?.education?.degreeLevel?.degreeLevel} , ${user?.education?.degreeTitle}",
                                        fontSize: foontSize.font16,
                                        fontFamily: foontFamily.tajawalRegular,
                                      ),
                                      MText(
                                        text:
                                            "${user?.education?.startYear?.yearMonthDay}_${user?.education?.endYear?.yearMonthDay}",
                                        fontSize: foontSize.font16,
                                        fontFamily: foontFamily.tajawalRegular,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ).mPadding(
                            top: spaces.space12,
                            bottom: spaces.space101,
                          ),
                          Center(
                            child: MBouncingButton(
                              title: context.localization?.openCv,
                              color: coolors.primaryColor,
                              onTap: () => urlModel.openUrl(
                                context: context,
                                url: user?.cv,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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
