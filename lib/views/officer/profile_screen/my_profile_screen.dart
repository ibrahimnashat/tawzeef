import 'package:tawzeef/controller/consts/exports.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

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
                                  child:
                                      Consumer(builder: (context, ref, child) {
                                    final controller = ref.watch(
                                        ChangeNotifierProvider(
                                            (ref) => localSavingData));
                                    return MNetworkImage(
                                      url: controller.logUser.image ?? '',
                                      fit: BoxFit.cover,
                                      borderRadius: 100,
                                      height: 150,
                                      width: 150,
                                    );
                                  }),
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Consumer(builder: (context, ref, child) {
                                final controller = ref.watch(
                                    ChangeNotifierProvider(
                                        (ref) => localSavingData));
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MText(
                                      text: controller.logUser.name,
                                      fontSize: foontSize.font24,
                                      fontFamily: foontFamily.tajawalBold,
                                    ).mPadding(top: spaces.space12),
                                    MText(
                                      text: controller
                                          .logUser.education?.degreeType,
                                      fontSize: foontSize.font18,
                                      fontFamily: foontFamily.tajawalRegular,
                                    ),
                                    MText(
                                      text:
                                          "${controller.logUser.phone} | ${controller.logUser.email}",
                                      fontSize: foontSize.font16,
                                      fontFamily: foontFamily.tajawalRegular,
                                    ),
                                    MText(
                                      text:
                                          "${controller.logUser.state?.state}, ${controller.logUser.country?.country}",
                                      fontSize: foontSize.font16,
                                      fontFamily: foontFamily.tajawalRegular,
                                    ),
                                  ],
                                );
                              }),
                              MSvg(
                                name: svgs.edit,
                                color: coolors.black,
                                height: 30,
                              ).mPadding(all: spaces.space12).mAddAction(
                                    onTap: () =>
                                        context.push(const EditProfileScreen()),
                                  ),
                            ],
                          ),
                          const Divider().mPadding(top: spaces.space12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MSvg(
                                    name: svgs.education,
                                  ).mPadding(end: spaces.space24),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MText(
                                        text: context.localization?.education,
                                        fontSize: foontSize.font22,
                                        fontFamily: foontFamily.tajawalBold,
                                        fontColor: coolors.primaryColor,
                                      ),
                                      Consumer(builder: (context, ref, child) {
                                        final controller = ref.watch(
                                            ChangeNotifierProvider(
                                                (ref) => localSavingData));
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            MText(
                                              text: controller.logUser.education
                                                  ?.university,
                                              fontSize: foontSize.font16,
                                              fontFamily:
                                                  foontFamily.tajawalRegular,
                                            ),
                                            MText(
                                              text:
                                                  "${controller.logUser.education?.degreeLevel?.degreeLevel} , ${controller.logUser.education?.degreeTitle}",
                                              fontSize: foontSize.font16,
                                              fontFamily:
                                                  foontFamily.tajawalRegular,
                                            ),
                                            MText(
                                              text:
                                                  "${controller.logUser.education?.startYear?.yearMonthDay}_${controller.logUser.education?.endYear?.yearMonthDay}",
                                              fontSize: foontSize.font16,
                                              fontFamily:
                                                  foontFamily.tajawalRegular,
                                            ),
                                          ],
                                        );
                                      }),
                                    ],
                                  )
                                ],
                              ).mPadding(vertical: spaces.space12),
                              MSvg(
                                name: svgs.edit,
                                color: coolors.black,
                                height: 30,
                              ).mPadding(all: spaces.space12).mAddAction(
                                  onTap: () => context
                                      .push(const EditEducationScreen())),
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
                                url: localSavingData.logUser.cv,
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
