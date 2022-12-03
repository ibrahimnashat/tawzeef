import 'package:tawzeef/shared/consts/exports.dart';

import 'widgets/applicant_user_item.dart';
import 'widgets/company_ad_item.dart';

class CompanyOrPharmacyHomeScreen extends StatefulWidget {
  const CompanyOrPharmacyHomeScreen({Key? key}) : super(key: key);

  @override
  State<CompanyOrPharmacyHomeScreen> createState() =>
      _CompanyOrPharmacyHomeScreenState();
}

class _CompanyOrPharmacyHomeScreenState
    extends State<CompanyOrPharmacyHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late AutoDisposeChangeNotifierProvider<CompanyOrPharnamcyHomeScreenModel>
      homeController =
      AutoDisposeChangeNotifierProvider<CompanyOrPharnamcyHomeScreenModel>(
          (ref) => CompanyOrPharnamcyHomeScreenModel(context));
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
                        Consumer(builder: (context, ref, child) {
                          final controller = ref.watch(
                              ChangeNotifierProvider((ref) => localStorage));
                          return MNetworkImage(
                            url: controller.logUser.image ?? '',
                            fit: BoxFit.cover,
                            borderRadius: 100,
                            height: 70,
                            width: 70,
                          ).mAddAction(
                              onTap: () => context
                                  .push(const MyCompanyOrPharmacyScreen()));
                        }),
                        MSvg(
                          name: svgs.drawer,
                          color: coolors.white,
                        ).mPadding(top: spaces.space12).mAddAction(
                            onTap: () =>
                                _scaffoldKey.currentState!.openDrawer()),
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
                        onChanged: (res) => controller.makeSearch(res),
                        controller: controller.search,
                        hintText: context.localization?.searchPharmacist,
                        fillColor: coolors.white,
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
                              ).mAddAction(
                                onTap: () => controller.viewBottomSheet(
                                  context,
                                  CompanyOrPharmacyFilterScreen(
                                    homeController: homeController,
                                  ),
                                ),
                              );
                            }).mPadding(end: spaces.space15),
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
                      if (controller.isNotFound) return Loader.empty();
                      return PaginatedList<UserModel>(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.only(top: spaces.space38),
                        loadingIndicator:
                            Loader.loading().mPadding(all: spaces.space21),
                        items: controller.currentUsers,
                        isLastPage: controller.isLastPage,
                        onLoadMore: (index) => controller.getUsers(context),
                        builder: (movie, index) {
                          return Column(
                            children: [
                              ApplicantUserItem(
                                user: controller.currentUsers.elementAt(index),
                              ),
                              if (index % 3 == 0 && index != 0)
                                CompanyAdItem(
                                  ad: controller.ads
                                      .elementAt(controller.adIndex),
                                )
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
      drawer: const CompanyOrPharmacyDrawerScreen(),
      floatingActionButton: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          color: coolors.primaryColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.add,
          color: coolors.white,
        ),
      ).mAddAction(
        onTap: () => context.push(const AddJobScreen()),
      ),
    );
  }
}
