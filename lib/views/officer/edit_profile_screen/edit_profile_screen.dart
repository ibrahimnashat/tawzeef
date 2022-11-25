import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/objects/city_model.dart';
import 'package:tawzeef/models/objects/country_model.dart';
import 'package:tawzeef/models/objects/state_model.dart';

class EditProfileScreen extends StatefulWidget {
  final Function afterEditation;
  const EditProfileScreen({
    Key? key,
    required this.afterEditation,
  }) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late AutoDisposeChangeNotifierProvider<EditProfileScreenModel>
      editProfileController =
      AutoDisposeChangeNotifierProvider<EditProfileScreenModel>(
          (ref) => EditProfileScreenModel(context));

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
                      text: context.localization?.myProfile,
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
                            final controller = ref.watch(editProfileController);
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
                              url: localSavingData.logUser.image ?? '',
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
                            final controller = ref.watch(editProfileController);
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
                    final controller = ref.watch(editProfileController);
                    return MTextFiled(
                      hintText: localSavingData.logUser.name,
                      controller: controller.name,
                      lableText: context.localization?.name,
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
                    final controller = ref.watch(editProfileController);
                    return MTextFiled(
                      hintText: localSavingData.logUser.email,
                      controller: controller.email,
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
                    final controller = ref.watch(editProfileController);
                    return MTextFiled(
                      hintText: localSavingData.logUser.phone,
                      controller: controller.phone,
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
                    final controller = ref.watch(editProfileController);
                    return MTextFiled(
                      hintText: localSavingData.logUser.dateOfBirth,
                      controller: controller.dateOfBirth,
                      lableText: context.localization?.dateOfBirth,
                      textColor: coolors.primaryColor,
                      enabled: false,
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
                    ).mAddAction(onTap: () {
                      controller.showDateTimePicker(context);
                    }).mPadding(bottom: spaces.space24);
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
                          final controller = ref.watch(editProfileController);
                          return MDropDown<CountryModel>(
                            itemTitle: (res) => res.country!,
                            setInitial: controller.country,
                            hint: localSavingData.logUser.country?.country ??
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
                          final controller = ref.watch(editProfileController);
                          return MDropDown<StateModel>(
                            itemTitle: (res) => res.state!,
                            setInitial: controller.state,
                            hint: localSavingData.logUser.state?.state ??
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
                          final controller = ref.watch(editProfileController);
                          return MDropDown<CityModel>(
                            itemTitle: (res) => res.city!,
                            setInitial: controller.city,
                            hint: localSavingData.logUser.city?.city ??
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
                  ).mPadding(top: spaces.space21, bottom: spaces.space24),
                  Consumer(builder: (context, ref, child) {
                    final controller = ref.watch(editProfileController);
                    return Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      runAlignment: WrapAlignment.spaceBetween,
                      direction: Axis.horizontal,
                      spacing: spaces.space12,
                      runSpacing: spaces.space12,
                      children: [
                        if (controller.cvPdf != null)
                          Row(
                            children: [
                              Icon(
                                Icons.clear,
                                color: coolors.red,
                                size: 25,
                              )
                                  .mPadding(
                                      end: spaces.space12,
                                      bottom: spaces.space21)
                                  .mAddAction(
                                      onTap: () => controller.clearCv()),
                              MText(
                                text: controller.cvPdf?.path.split('/').last,
                                maxWidth: context.w * 0.5,
                                maxLines: 2,
                                fontSize: foontSize.font18,
                                fontFamily: foontFamily.tajawalBold,
                              ),
                            ],
                          ),
                        Center(
                          child: MBouncingButton(
                            borderRadius: 25,
                            title: localSavingData.logUser.cv == null
                                ? context.localization?.yourCV
                                : context.localization?.updateCV,
                            icon: svgs.upload,
                            height: 50,
                            color: coolors.primaryColor,
                            textSize: foontSize.font16,
                            onTap: () => controller.cvPicker(),
                          ).mPadding(bottom: spaces.space24),
                        ),
                      ],
                    );
                  }),
                ],
              ).mPadding(bottom: spaces.space21),
            ),
          ),
          Consumer(builder: (context, ref, child) {
            final controller = ref.watch(editProfileController);
            return MBouncingButton(
              title: context.localization?.save,
              color: coolors.primaryColor,
              onTap: () =>
                  controller.editProfile(context, widget.afterEditation),
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
