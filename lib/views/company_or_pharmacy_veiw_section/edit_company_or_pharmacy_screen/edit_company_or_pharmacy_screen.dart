import 'package:tawzeef/shared/consts/exports.dart';

class EditCompanyOrPharmacyScreen extends StatefulWidget {
  final Function afterEditation;
  const EditCompanyOrPharmacyScreen({
    Key? key,
    required this.afterEditation,
  }) : super(key: key);

  @override
  State<EditCompanyOrPharmacyScreen> createState() =>
      _EditCompanyOrPharmacyScreenState();
}

class _EditCompanyOrPharmacyScreenState
    extends State<EditCompanyOrPharmacyScreen> {
  late AutoDisposeChangeNotifierProvider<EditMyCompanyOrPharnamcyScreenModel>
      editCompanyController =
      AutoDisposeChangeNotifierProvider<EditMyCompanyOrPharnamcyScreenModel>(
          (ref) => EditMyCompanyOrPharnamcyScreenModel(context));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: coolors.white,
      appBar: PreferredSize(
        preferredSize: Size(context.w, 90),
        child: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: MSvg(
                  name: svgs.back,
                  height: 30,
                  width: 30,
                )
                    .mFlap
                    .mPadding(
                      start: spaces.space21,
                    )
                    .mAddAction(onTap: widget.afterEditation),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MSvg(
                      name: svgs.person,
                      color: coolors.primaryColor,
                      width: 32,
                      height: 32,
                    ).mPadding(end: spaces.space12),
                    MText(
                      text: context.localization?.myCompany,
                      fontColor: coolors.black,
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
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: spaces.space21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: coolors.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Consumer(builder: (context, ref, child) {
                            final controller = ref.watch(editCompanyController);
                            if (controller.profileImg != null) {
                              return MFileImage(
                                file: controller.profileImg!.path,
                                fit: BoxFit.cover,
                                borderRadius: 100,
                                height: 150,
                                width: 150,
                              );
                            }
                            return MNetworkImage(
                              url: localStorage.logUser.image ?? '',
                              fit: BoxFit.cover,
                              borderRadius: 100,
                              height: 150,
                              width: 150,
                            );
                          }),
                        ),
                        PositionedDirectional(
                          bottom: 5,
                          end: 10,
                          child: Consumer(builder: (context, ref, child) {
                            final controller = ref.watch(editCompanyController);
                            return MSvg(
                              name: svgs.edit,
                              width: 32,
                              height: 32,
                              color: coolors.black,
                            ).mAddAction(onTap: () => controller.imgPicker());
                          }),
                        )
                      ],
                    ),
                  ),
                  Consumer(builder: (context, ref, child) {
                    final controller = ref.watch(editCompanyController);
                    return MTextFiled(
                      controller: controller.name,
                      hintText: localStorage.logUser.name,
                      lableText: context.localization?.companyName,
                      textColor: coolors.primaryColor,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: coolors.primaryColor,
                          style: BorderStyle.solid,
                          width: 0.70,
                        ),
                      ),
                      suffix: MSvg(
                        name: svgs.correctCheck,
                      ),
                    ).mPadding(bottom: spaces.space24);
                  }),
                  Consumer(builder: (context, ref, child) {
                    final controller = ref.watch(editCompanyController);
                    return MTextFiled(
                      controller: controller.email,
                      hintText: localStorage.logUser.email,
                      lableText: context.localization?.email,
                      textColor: coolors.primaryColor,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: coolors.primaryColor,
                          style: BorderStyle.solid,
                          width: 0.70,
                        ),
                      ),
                      suffix: MSvg(
                        name: svgs.correctCheck,
                      ),
                    ).mPadding(bottom: spaces.space24);
                  }),
                  Consumer(builder: (context, ref, child) {
                    final controller = ref.watch(editCompanyController);
                    return MTextFiled(
                      controller: controller.phone,
                      hintText: localStorage.logUser.phone,
                      lableText: context.localization?.phone,
                      textColor: coolors.primaryColor,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: coolors.primaryColor,
                          style: BorderStyle.solid,
                          width: 0.70,
                        ),
                      ),
                      suffix: MSvg(
                        name: svgs.correctCheck,
                      ),
                    ).mPadding(bottom: spaces.space24);
                  }),
                  Consumer(builder: (context, ref, child) {
                    final controller = ref.watch(editCompanyController);
                    return MTextFiled(
                      lableText: context.localization?.noOfEmployees,
                      controller: controller.noOfEmployees,
                      hintText: localStorage.logUser.noOfEmployees,
                      textColor: coolors.primaryColor,
                      keyboardType: TextInputType.number,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: coolors.primaryColor,
                          style: BorderStyle.solid,
                          width: 0.70,
                        ),
                      ),
                      suffix: MSvg(
                        name: svgs.correctCheck,
                      ),
                    ).mPadding(bottom: spaces.space24);
                  }),
                  MText(
                    text: context.localization?.jobDetails,
                    fontColor: coolors.primaryColor,
                    fontSize: foontSize.font20,
                  ).mPadding(bottom: spaces.space8),
                  Consumer(builder: (context, ref, child) {
                    final controller = ref.watch(editCompanyController);
                    return MTextFiled(
                      controller: controller.description,
                      hintText: localStorage.logUser.description,
                      textColor: coolors.primaryColor,
                      paddingHorizontal: spaces.space12,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: coolors.primaryColor,
                          style: BorderStyle.solid,
                          width: 0.70,
                        ),
                      ),
                      maxLines: 5,
                    ).mPadding(top: spaces.space21, bottom: spaces.space24);
                  }),
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    runAlignment: WrapAlignment.spaceBetween,
                    direction: Axis.horizontal,
                    spacing: spaces.space12,
                    runSpacing: spaces.space12,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: spaces.space24),
                        decoration: BoxDecoration(
                          border: Border.all(color: coolors.primaryColor),
                          borderRadius: BorderRadius.circular(25),
                          color: coolors.primaryColor,
                        ),
                        child: Consumer(builder: (context, ref, child) {
                          final controller = ref.watch(editCompanyController);
                          return MDropDown<CountryModel>(
                            itemTitle: (res) => res.country!,
                            setInitial: controller.country,
                            hint: localStorage.logUser.country?.country ??
                                context.localization?.country,
                            dropdownColor: coolors.primaryColor,
                            iconColor: coolors.white,
                            textColor: coolors.white,
                            textSize: foontSize.font16,
                            removeBorder: true,
                            isExpanded: false,
                            onChanged: (res) =>
                                controller.changeCountry(res, context),
                            options: controller.countries,
                          );
                        }),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: spaces.space24),
                        decoration: BoxDecoration(
                          border: Border.all(color: coolors.primaryColor),
                          borderRadius: BorderRadius.circular(25),
                          color: coolors.primaryColor,
                        ),
                        child: Consumer(builder: (context, ref, child) {
                          final controller = ref.watch(editCompanyController);
                          return MDropDown<StateModel>(
                            itemTitle: (res) => res.state!,
                            setInitial: controller.state,
                            hint: localStorage.logUser.state?.state ??
                                context.localization?.state,
                            iconColor: coolors.white,
                            dropdownColor: coolors.primaryColor,
                            textColor: coolors.white,
                            textSize: foontSize.font16,
                            removeBorder: true,
                            isExpanded: false,
                            onChanged: (res) =>
                                controller.changeState(res, context),
                            options: controller.states,
                          );
                        }),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: spaces.space24),
                        decoration: BoxDecoration(
                          border: Border.all(color: coolors.primaryColor),
                          borderRadius: BorderRadius.circular(25),
                          color: coolors.primaryColor,
                        ),
                        child: Consumer(builder: (context, ref, child) {
                          final controller = ref.watch(editCompanyController);
                          return MDropDown<CityModel>(
                            itemTitle: (res) => res.city!,
                            setInitial: controller.city,
                            hint: localStorage.logUser.city?.city ??
                                context.localization?.city,
                            iconColor: coolors.white,
                            dropdownColor: coolors.primaryColor,
                            textColor: coolors.white,
                            textSize: foontSize.font16,
                            removeBorder: true,
                            isExpanded: false,
                            onChanged: (res) => controller.changeCity(res),
                            options: controller.cities,
                          );
                        }),
                      ),
                    ],
                  ).mPadding(bottom: spaces.space44),
                ],
              ),
            ),
          ),
          Consumer(builder: (context, ref, child) {
            final controller = ref.watch(editCompanyController);
            return MBouncingButton(
              title: context.localization?.save,
              color: coolors.primaryColor,
              onTap: () =>
                  controller.editCompanyProfile(context, widget.afterEditation),
            );
          }),
        ],
      ).mPadding(
        horizontal: spaces.space24,
        vertical: spaces.space21,
      ),
    );
  }
}
