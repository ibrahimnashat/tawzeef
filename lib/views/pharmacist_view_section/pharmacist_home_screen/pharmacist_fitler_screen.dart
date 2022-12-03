import 'package:tawzeef/shared/consts/exports.dart';

class PharmacistFilterScreen extends ConsumerWidget {
  final AutoDisposeChangeNotifierProvider<PharmacistHomeScreenModel>
      homeController;
  const PharmacistFilterScreen({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final controller = ref.watch(homeController);
    return SizedBox(
      width: context.w,
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    MText(
                      text: context.localization?.location,
                      fontFamily: foontFamily.tajawalBold,
                      fontSize: foontSize.font22,
                    ),
                  ],
                ),
                Container(
                  width: 350,
                  padding: EdgeInsets.symmetric(
                    horizontal: spaces.space24,
                    vertical: spaces.space5,
                  ),
                  margin: EdgeInsetsDirectional.only(top: spaces.space24),
                  decoration: BoxDecoration(
                    border: Border.all(color: coolors.primaryColor),
                    borderRadius: BorderRadius.circular(25),
                    color: coolors.primaryColor,
                  ),
                  child: MDropDown<CountryModel>(
                    hint: context.localization?.country,
                    setInitial: controller.country,
                    iconColor: coolors.white,
                    dropdownColor: coolors.primaryColor,
                    textColor: coolors.white,
                    removeBorder: true,
                    itemTitle: (res) => res.country!,
                    onChanged: (res) => controller.changeCountry(res, context),
                    options: controller.countries,
                  ),
                ),
                Container(
                  width: 350,
                  padding: EdgeInsets.symmetric(
                    horizontal: spaces.space24,
                    vertical: spaces.space5,
                  ),
                  margin: EdgeInsetsDirectional.only(top: spaces.space24),
                  decoration: BoxDecoration(
                    border: Border.all(color: coolors.primaryColor),
                    borderRadius: BorderRadius.circular(25),
                    color: coolors.primaryColor,
                  ),
                  child: MDropDown<StateModel>(
                    hint: context.localization?.state,
                    setInitial: controller.state,
                    iconColor: coolors.white,
                    dropdownColor: coolors.primaryColor,
                    textColor: coolors.white,
                    removeBorder: true,
                    itemTitle: (res) => res.state!,
                    onChanged: (res) => controller.changeState(res, context),
                    options: controller.states,
                  ),
                ),
                Container(
                  width: 350,
                  padding: EdgeInsets.symmetric(
                    horizontal: spaces.space24,
                    vertical: spaces.space5,
                  ),
                  margin: EdgeInsetsDirectional.only(top: spaces.space24),
                  decoration: BoxDecoration(
                    border: Border.all(color: coolors.primaryColor),
                    borderRadius: BorderRadius.circular(25),
                    color: coolors.primaryColor,
                  ),
                  child: MDropDown<CityModel>(
                    hint: context.localization?.city,
                    setInitial: controller.city,
                    iconColor: coolors.white,
                    dropdownColor: coolors.primaryColor,
                    textColor: coolors.white,
                    removeBorder: true,
                    itemTitle: (res) => res.city!,
                    onChanged: (res) => controller.changeCity(res),
                    options: controller.cities,
                  ),
                ),
                Row(
                  children: [
                    MText(
                      text: context.localization?.jobType,
                      fontFamily: foontFamily.tajawalBold,
                      fontSize: foontSize.font22,
                    ),
                  ],
                ).mPadding(top: spaces.space21),
                Container(
                  width: 350,
                  padding: EdgeInsets.symmetric(
                    horizontal: spaces.space24,
                    vertical: spaces.space5,
                  ),
                  margin: EdgeInsetsDirectional.only(top: spaces.space24),
                  decoration: BoxDecoration(
                    border: Border.all(color: coolors.primaryColor),
                    borderRadius: BorderRadius.circular(25),
                    color: coolors.primaryColor,
                  ),
                  child: MDropDown<JobTitleModel>(
                    hint: "Jop Title",
                    itemTitle: (item) => item.title!,
                    setInitial: controller.jopTitle,
                    iconColor: coolors.white,
                    dropdownColor: coolors.primaryColor,
                    textColor: coolors.white,
                    removeBorder: true,
                    onChanged: (res) => controller.changeJopTitle(res),
                    options: controller.jobTitles,
                  ),
                ),
              ],
            ),
          ),
          MBouncingButton(
            title: context.localization?.apply,
            color: coolors.primaryColor,
            onTap: () => controller.searchJob(context),
          ),
        ],
      ).mPadding(
        horizontal: spaces.space24,
        vertical: spaces.space50,
      ),
    );
  }
}
