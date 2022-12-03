import 'package:tawzeef/shared/consts/exports.dart';

class AddJobScreen extends StatefulWidget {
  final JobModel? job;
  const AddJobScreen({
    Key? key,
    this.job,
  }) : super(key: key);

  @override
  State<AddJobScreen> createState() => _AddJobScreenState();
}

class _AddJobScreenState extends State<AddJobScreen> {
  late AutoDisposeChangeNotifierProvider<AddJobScreenModel> addJobController =
      AutoDisposeChangeNotifierProvider<AddJobScreenModel>(
          (ref) => AddJobScreenModel(context));

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
                    .mAddAction(onTap: () => context.pop()),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MSvg(
                      name: svgs.job,
                      color: coolors.primaryColor,
                    ).mPadding(end: spaces.space12),
                    MText(
                      text: widget.job != null
                          ? context.localization?.editJob
                          : context.localization?.addJob,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: spaces.space24),
                    decoration: BoxDecoration(
                      border: Border.all(color: coolors.primaryColor),
                      borderRadius: BorderRadius.circular(25),
                      color: coolors.primaryColor,
                    ),
                    child: Consumer(builder: (context, ref, child) {
                      final controller = ref.watch(addJobController);
                      return MDropDown<JobTitleModel>(
                        itemTitle: (res) => res.title!,
                        setInitial: controller.jobTitle,
                        hint: widget.job?.jobTitle?.title ??
                            context.localization?.jobTitle,
                        iconColor: coolors.white,
                        dropdownColor: coolors.primaryColor,
                        textColor: coolors.white,
                        textSize: foontSize.font16,
                        removeBorder: true,
                        isExpanded: false,
                        onChanged: (res) => controller.changeJobTitle(res),
                        options: controller.jobTitles,
                      );
                    }),
                  ).mPadding(bottom: spaces.space12),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: spaces.space24),
                    decoration: BoxDecoration(
                      border: Border.all(color: coolors.primaryColor),
                      borderRadius: BorderRadius.circular(25),
                      color: coolors.primaryColor,
                    ),
                    child: Consumer(builder: (context, ref, child) {
                      final controller = ref.watch(addJobController);
                      return MDropDown<JobTypeModel>(
                        itemTitle: (res) => res.jobtype!,
                        setInitial: controller.jobType,
                        hint: widget.job?.jobType?.jobtype ??
                            context.localization?.jobType,
                        iconColor: coolors.white,
                        dropdownColor: coolors.primaryColor,
                        textColor: coolors.white,
                        textSize: foontSize.font16,
                        removeBorder: true,
                        isExpanded: false,
                        onChanged: (res) => controller.changeJobType(res),
                        options: controller.jobTypes,
                      );
                    }),
                  ).mPadding(bottom: spaces.space12),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: spaces.space24),
                    decoration: BoxDecoration(
                      border: Border.all(color: coolors.primaryColor),
                      borderRadius: BorderRadius.circular(25),
                      color: coolors.primaryColor,
                    ),
                    child: Consumer(builder: (context, ref, child) {
                      final controller = ref.watch(addJobController);
                      return MDropDown<CareerLevelModel>(
                        itemTitle: (res) => res.career!,
                        setInitial: controller.careerLevel,
                        hint: widget.job?.careerLevel?.career ??
                            context.localization?.careerLevel,
                        iconColor: coolors.white,
                        dropdownColor: coolors.primaryColor,
                        textColor: coolors.white,
                        textSize: foontSize.font16,
                        removeBorder: true,
                        isExpanded: false,
                        onChanged: (res) => controller.changeCareerLevel(res),
                        options: controller.careerLevels,
                      );
                    }),
                  ).mPadding(bottom: spaces.space12),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: spaces.space24),
                    decoration: BoxDecoration(
                      border: Border.all(color: coolors.primaryColor),
                      borderRadius: BorderRadius.circular(25),
                      color: coolors.primaryColor,
                    ),
                    child: Consumer(builder: (context, ref, child) {
                      final controller = ref.watch(addJobController);
                      return MDropDown<JobShiftModel>(
                        itemTitle: (res) => res.jobshift!,
                        setInitial: controller.jobShift,
                        hint: widget.job?.jobShift?.jobshift ??
                            context.localization?.jobShift,
                        iconColor: coolors.white,
                        dropdownColor: coolors.primaryColor,
                        textColor: coolors.white,
                        textSize: foontSize.font16,
                        removeBorder: true,
                        isExpanded: false,
                        onChanged: (res) => controller.changeJobShift(res),
                        options: controller.jobShifts,
                      );
                    }),
                  ).mPadding(bottom: spaces.space12),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: spaces.space24),
                    decoration: BoxDecoration(
                      border: Border.all(color: coolors.primaryColor),
                      borderRadius: BorderRadius.circular(25),
                      color: coolors.primaryColor,
                    ),
                    child: Consumer(builder: (context, ref, child) {
                      final controller = ref.watch(addJobController);
                      return MDropDown<JobExperienceModel>(
                        itemTitle: (res) => res.jobexperience!,
                        setInitial: controller.jobExperience,
                        hint: widget.job?.jobExperience?.jobexperience ??
                            context.localization?.jobExperience,
                        iconColor: coolors.white,
                        dropdownColor: coolors.primaryColor,
                        textColor: coolors.white,
                        textSize: foontSize.font16,
                        removeBorder: true,
                        isExpanded: false,
                        onChanged: (res) => controller.changeJobExperience(res),
                        options: controller.jobExperiences,
                      );
                    }),
                  ).mPadding(bottom: spaces.space12),
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
                          final controller = ref.watch(addJobController);
                          return MDropDown<CountryModel>(
                            itemTitle: (res) => res.country!,
                            setInitial: controller.country,
                            hint: widget.job?.country?.country ??
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
                          final controller = ref.watch(addJobController);
                          return MDropDown<StateModel>(
                            itemTitle: (res) => res.state!,
                            setInitial: controller.state,
                            hint: widget.job?.state?.state ??
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
                          final controller = ref.watch(addJobController);
                          return MDropDown<CityModel>(
                            itemTitle: (res) => res.city!,
                            setInitial: controller.city,
                            hint: widget.job?.city?.city ??
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
                  ).mPadding(bottom: spaces.space24),
                  Consumer(builder: (context, ref, child) {
                    final controller = ref.watch(addJobController);
                    return MTextFiled(
                      enabled: false,
                      controller: controller.jobExpired,
                      hintText: widget.job?.expired,
                      lableText: context.localization?.jobExpired,
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
                    ).mPadding(bottom: spaces.space12).mAddAction(
                        onTap: () => controller.setJobExpired(context));
                  }),
                  Consumer(builder: (context, ref, child) {
                    final controller = ref.watch(addJobController);
                    return MTextFiled(
                      controller: controller.salary,
                      hintText: widget.job?.salary.toString(),
                      lableText: context.localization?.salary,
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
                    ).mPadding(bottom: spaces.space12);
                  }),
                  Consumer(builder: (context, ref, child) {
                    final controller = ref.watch(addJobController);
                    return MTextFiled(
                      controller: controller.noOfPositions,
                      hintText: widget.job?.position.toString(),
                      keyboardType: TextInputType.number,
                      lableText: context.localization?.noOfEmployees,
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
                    ).mPadding(bottom: spaces.space21);
                  }),
                  MText(
                    text: context.localization?.jobDetails,
                    fontColor: coolors.primaryColor,
                    fontSize: foontSize.font20,
                  ).mPadding(bottom: spaces.space8),
                  Consumer(builder: (context, ref, child) {
                    final controller = ref.watch(addJobController);
                    return MTextFiled(
                      controller: controller.description,
                      hintText: widget.job?.jobDescription,
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
                    ).mPadding(bottom: spaces.space44);
                  }),
                ],
              ),
            ),
          ),
          Consumer(builder: (context, ref, child) {
            final controller = ref.watch(addJobController);
            return MBouncingButton(
              title: widget.job != null
                  ? context.localization?.editJob
                  : context.localization?.apply,
              color: coolors.primaryColor,
              onTap: () {
                if (widget.job != null) {
                  controller.editJob(context, widget.job?.id);
                } else {
                  controller.addJob(context);
                }
              },
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
