import 'package:tawzeef/controller/consts/exports.dart';

class MyCompanyScreen extends StatelessWidget {
  const MyCompanyScreen({Key? key}) : super(key: key);

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
                                      child: Consumer(
                                          builder: (context, ref, child) {
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
                                MSvg(
                                  name: svgs.edit,
                                  color: coolors.black,
                                )
                                    .mPadding(
                                      top: spaces.space24,
                                    )
                                    .mAddAction(
                                      onTap: () => context.push(
                                        EditCompanyScreen(
                                          afterEditation: () => context.pop(),
                                        ),
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
                      child: Consumer(builder: (context, ref, child) {
                        final controller = ref.watch(
                            ChangeNotifierProvider((ref) => localSavingData));
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MText(
                              text: controller.logUser.name,
                              fontSize: foontSize.font24,
                              fontFamily: foontFamily.tajawalBold,
                              fontColor: coolors.primaryColor,
                            ).mPadding(top: spaces.space12),
                            MText(
                              text:
                                  '${controller.logUser.phone} | ${controller.logUser.email}',
                              fontSize: foontSize.font18,
                              fontFamily: foontFamily.tajawalRegular,
                            ),
                            MText(
                              text:
                                  '${controller.logUser.state?.state}, ${controller.logUser.country?.country}',
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
                              text: controller.logUser.description,
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
                              text: controller.logUser.noOfEmployees,
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
                                  '${controller.logUser.city?.city}, ${controller.logUser.state?.state}, ${controller.logUser.country?.country}',
                              fontSize: foontSize.font18,
                              maxWidth: context.w * 0.9,
                              maxLines: 10,
                            ).mPadding(vertical: spaces.space12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MText(
                                  text: context.localization?.socialMedia,
                                  fontColor: coolors.primaryColor,
                                  fontFamily: foontFamily.tajawalBold,
                                  fontSize: foontSize.font22,
                                ),
                                MSvg(
                                  name: svgs.edit,
                                  color: coolors.black,
                                )
                                    .mPadding(
                                      bottom: spaces.space8,
                                    )
                                    .mAddAction(
                                        onTap: () => context
                                            .push(const AddLinksScreen())),
                              ],
                            ).mPadding(
                              bottom: spaces.space24,
                              top: spaces.space50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MIconButton(
                                  icon: svgs.website,
                                  onTap: () => urlModel.openUrl(
                                    context: context,
                                    url: localSavingData.logUser.website,
                                  ),
                                  iconColor: coolors.blue,
                                ).mPadding(horizontal: spaces.space21),
                                MIconButton(
                                  icon: svgs.linkedin,
                                  onTap: () => urlModel.openUrl(
                                    context: context,
                                    url: localSavingData.logUser.linkedin,
                                  ),
                                  iconColor: coolors.blue,
                                ),
                                MIconButton(
                                  icon: svgs.facebook,
                                  onTap: () => urlModel.openUrl(
                                    context: context,
                                    url: localSavingData.logUser.facebook,
                                  ),
                                  iconColor: coolors.blue,
                                ).mPadding(horizontal: spaces.space21),
                                MIconButton(
                                  icon: svgs.twitter,
                                  onTap: () => urlModel.openUrl(
                                    context: context,
                                    url: localSavingData.logUser.twitter,
                                  ),
                                  iconColor: coolors.blue,
                                ),
                              ],
                            )
                          ],
                        );
                      }),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      drawer: const CompanyDrawerScreen(),
    );
  }
}
