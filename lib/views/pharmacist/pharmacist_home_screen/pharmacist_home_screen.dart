import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:tawzeef/shared/consts/exports.dart';

import 'widgets/job_offer_item.dart';
import 'widgets/pharmacist_ad_item.dart';

class PharmacistHomeScreen extends StatefulWidget {
  const PharmacistHomeScreen({Key? key}) : super(key: key);

  @override
  State<PharmacistHomeScreen> createState() => _PharmacistHomeScreenState();
}

class _PharmacistHomeScreenState extends State<PharmacistHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late AutoDisposeChangeNotifierProvider<PharmacistHomeScreenModel>
      homeController =
      AutoDisposeChangeNotifierProvider<PharmacistHomeScreenModel>(
          (ref) => PharmacistHomeScreenModel(context));
  late ChangeNotifierProvider<PharmacistDrawerScreenModel> drawerController =
      ChangeNotifierProvider<PharmacistDrawerScreenModel>(
          (ref) => PharmacistDrawerScreenModel(context));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MSvg(
                          name: svgs.drawer,
                          color: coolors.white,
                        ).mPadding(top: spaces.space12).mAddAction(
                            onTap: () =>
                                _scaffoldKey.currentState!.openDrawer()),
                        Stack(
                          children: [
                            MSvg(
                              name: svgs.outlineNotification,
                              color: coolors.white,
                              width: 34,
                              height: 34,
                            ).mPadding(
                              start: spaces.space2,
                              top: spaces.space2,
                            ),
                            Consumer(builder: (context, ref, child) {
                              final controller = ref.watch(drawerController);
                              if (controller.unReadCount == 0) {
                                return const SizedBox();
                              }
                              return PositionedDirectional(
                                top: 0,
                                start: 0,
                                child: Container(
                                  padding: EdgeInsets.all(spaces.space5),
                                  decoration: BoxDecoration(
                                    color: coolors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: MText(
                                    text: controller.unReadCount.toString(),
                                    fontColor: coolors.white,
                                    fontFamily: foontFamily.tajawalRegular,
                                    fontSize: foontSize.font12,
                                  ),
                                ),
                              );
                            })
                          ],
                        ).mPadding(top: spaces.space12).mAddAction(
                            onTap: () => context
                                .push(const PharmacistNotificationScreen())),
                      ],
                    ),
                    Row(
                      children: [
                        MText(
                          text: context.localization?.welcome,
                          fontColor: coolors.white,
                          fontSize: foontSize.font32,
                        ),
                        Consumer(builder: (context, ref, child) {
                          final controller = ref.watch(
                              ChangeNotifierProvider((ref) => localStorage));
                          return MText(
                            text:
                                "${controller.logUser.name?.split(" ").first}",
                            fontFamily: foontFamily.tajawalMedium,
                            fontColor: coolors.white,
                            fontSize: foontSize.font32,
                          );
                        })
                      ],
                    ).mPadding(
                      top: spaces.space24,
                      start: spaces.space21,
                      bottom: spaces.space8,
                    ),
                    Consumer(builder: (context, ref, child) {
                      final controller = ref.watch(homeController);
                      return MTextFiled(
                        controller: controller.search,
                        hintText: context.localization?.searchJob,
                        fillColor: coolors.white,
                        onChanged: (keyword) => controller.makeSearch(keyword),
                        filled: true,
                        textSize: foontSize.font18,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        paddingVertical: spaces.space21,
                        paddingHorizontal: spaces.space12,
                        suffix: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Consumer(builder: (context, ref, child) {
                              final controller = ref.watch(homeController);
                              return MSvg(
                                name: svgs.filter,
                                width: 28,
                                height: 28,
                                color: coolors.primaryColor,
                              ).mPadding(end: spaces.space15).mAddAction(
                                    onTap: () => controller.viewBottomSheet(
                                      context,
                                      PharmacistFilterScreen(
                                        homeController: homeController,
                                      ),
                                    ),
                                  );
                            }),
                            MSvg(
                              name: svgs.search,
                              width: 28,
                              height: 28,
                              color: coolors.primaryColor,
                            ),
                          ],
                        ).mPadding(end: spaces.space15),
                      );
                    })
                  ],
                ).mPadding(
                  horizontal: spaces.space24,
                  top: spaces.space12,
                  bottom: spaces.space21,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: coolors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                    child: Consumer(builder: (context, ref, child) {
                      final controller = ref.watch(homeController);
                      return PagewiseListView<JobModel>(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        pageLoadController: controller.pageLoadController,
                        showRetry: true,
                        physics: const BouncingScrollPhysics(),
                        noItemsFoundBuilder: (context) => Loader.empty(),
                        loadingBuilder: (context) =>
                            Loader.loading().mPadding(all: spaces.space21),
                        itemBuilder: (context, job, index) {
                          final contains =
                              job.jobTitle?.title?.contains(controller.keyword);
                          if (!(contains ?? false)) {
                            return const SizedBox();
                          }
                          return Column(
                            children: [
                              if (index % 4 == 0 && index != 0)
                                PharmacistAdItem(
                                  ad: controller.ads
                                      .elementAt(controller.adIndex),
                                ),
                              JobOfferItem(
                                job: job,
                              ),
                            ],
                          );
                        },
                      );
                    }),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      drawer: const PharmacistDrawerScreen(),
    );
  }
}
