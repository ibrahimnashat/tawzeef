import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/objects/degree_level_model.dart';

class EditEducationScreen extends StatefulWidget {
  const EditEducationScreen({Key? key}) : super(key: key);

  @override
  State<EditEducationScreen> createState() => _EditEducationScreenState();
}

class _EditEducationScreenState extends State<EditEducationScreen> {
  late AutoDisposeChangeNotifierProvider<EditEducationScreenModel>
      editEducationController =
      AutoDisposeChangeNotifierProvider<EditEducationScreenModel>(
          (ref) => EditEducationScreenModel(context));

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
                                      url: localSavingData.logUser.image ?? '',
                                      fit: BoxFit.cover,
                                      borderRadius: 100,
                                      height: 150,
                                      width: 150,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: spaces.space24),
                      width: context.w,
                      constraints: const BoxConstraints(maxHeight: 780),
                      decoration: BoxDecoration(color: coolors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              MSvg(
                                name: svgs.education,
                              ).mPadding(end: spaces.space21),
                              MText(
                                text: context.localization?.education,
                                fontSize: foontSize.font25,
                                fontFamily: foontFamily.tajawalBold,
                                fontColor: coolors.primaryColor,
                              ),
                            ],
                          ).mPadding(vertical: spaces.space21),
                          Consumer(builder: (context, ref, child) {
                            final controller =
                                ref.watch(editEducationController);
                            return MTextFiled(
                              controller: controller.university,
                              hintText: controller.education?.university,
                              lableText: context.localization?.university,
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
                            final controller =
                                ref.watch(editEducationController);
                            return MTextFiled(
                              controller: controller.jopType,
                              hintText: controller.education?.degreeType,
                              lableText: context.localization?.jobType,
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
                            final controller =
                                ref.watch(editEducationController);
                            return MDropDown<DegreeLevelModel>(
                              itemTitle: (res) => res.degreeLevel!,
                              hint: controller.degreeLevel?.degreeLevel ??
                                  context.localization?.degreeLevel,
                              onChanged: (res) =>
                                  controller.changeDegreeLevel(res),
                              options: controller.degreeLevels,
                            ).mPadding(bottom: spaces.space12);
                          }),
                          Consumer(builder: (context, ref, child) {
                            final controller =
                                ref.watch(editEducationController);
                            return MTextFiled(
                              controller: controller.degreeTitle,
                              hintText: controller.education?.degreeTitle,
                              lableText: context.localization?.filedOfStudy,
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
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Consumer(builder: (context, ref, child) {
                                  final controller =
                                      ref.watch(editEducationController);
                                  return MTextFiled(
                                    enabled: false,
                                    controller: controller.startYear,
                                    hintText: controller.education?.startYear,
                                    lableText: context.localization?.startYear,
                                    keyboardType: TextInputType.number,
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
                                  ).mAddAction(
                                    onTap: () =>
                                        controller.setStartDate(context),
                                  );
                                }),
                              ),
                              const Expanded(
                                flex: 1,
                                child: SizedBox(
                                  width: 10,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Consumer(builder: (context, ref, child) {
                                  final controller =
                                      ref.watch(editEducationController);
                                  return MTextFiled(
                                    enabled: false,
                                    controller: controller.endYear,
                                    hintText: controller.education?.endYear,
                                    lableText: context.localization?.endYear,
                                    keyboardType: TextInputType.number,
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
                                  ).mAddAction(
                                    onTap: () => controller.setEndDate(context),
                                  );
                                }),
                              ),
                            ],
                          ).mPadding(bottom: spaces.space38),
                          Consumer(builder: (context, ref, child) {
                            final controller =
                                ref.watch(editEducationController);
                            return MTextFiled(
                              controller: controller.grad,
                              hintText: controller.education?.grad,
                              lableText: context.localization?.grad,
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
                            final controller =
                                ref.watch(editEducationController);
                            return Center(
                              child: MBouncingButton(
                                title: context.localization?.save,
                                color: coolors.primaryColor,
                                onTap: () => controller.editEducation(context),
                              ).mPadding(
                                top: spaces.space71,
                              ),
                            );
                          }),
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
