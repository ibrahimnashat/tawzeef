import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/objects/city_model.dart';
import 'package:tawzeef/models/objects/country_model.dart';
import 'package:tawzeef/models/objects/state_model.dart';

class CompanyFilterScreen extends ConsumerWidget {
  final AutoDisposeChangeNotifierProvider<CompanyHomeScreenModel>
      homeController;
  const CompanyFilterScreen({
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
              ],
            ),
          ),
          MBouncingButton(
            title: context.localization?.apply,
            color: coolors.primaryColor,
            onTap: () => controller.searchUsers(context),
          ),
        ],
      ).mPadding(
        horizontal: spaces.space24,
        vertical: spaces.space50,
      ),
    );
  }
}
