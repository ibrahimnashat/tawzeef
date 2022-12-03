import 'package:tawzeef/shared/consts/exports.dart';
import 'menu_item.dart';

class JobApplicantItem extends StatelessWidget {
  final UserModel user;
  final AutoDisposeChangeNotifierProvider<JobApplicantsScreenModel>
      jobApplicantsController;
  const JobApplicantItem({
    Key? key,
    required this.user,
    required this.jobApplicantsController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    localSavingData.debuggerPrint(user.toJson());
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(1.5),
                  margin: EdgeInsetsDirectional.only(end: spaces.space8),
                  decoration: BoxDecoration(
                    color: coolors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: MNetworkImage(
                    url: user.image ?? '',
                    fit: BoxFit.cover,
                    borderRadius: 100,
                    height: 90,
                    width: 90,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MText(
                      text: user.name,
                      fontSize: foontSize.font20,
                      fontColor: coolors.primaryColor,
                      fontFamily: foontFamily.tajawalBold,
                    ),
                    MText(
                      text: user.education?.degreeType,
                      fontSize: foontSize.font16,
                    ),
                  ],
                )
              ],
            ),
            Consumer(builder: (context, ref, child) {
              final controller = ref.watch(jobApplicantsController);
              return PopMenuItem(
                onApply: () =>
                    controller.changeJobStatus(context, 'apply', user.id ?? 0),
                onReject: () =>
                    controller.changeJobStatus(context, 'reject', user.id ?? 0),
                onReview: () => controller.changeJobStatus(
                    context, 'inreview', user.id ?? 0),
              );
            })
          ],
        )
            .mAddAction(
              onTap: () => context.push(
                ApplicantScreen(
                  user: user,
                ),
              ),
            )
            .mPadding(horizontal: spaces.space24),
        Divider(
          endIndent: spaces.space5,
          indent: spaces.space5,
        ).mPadding(vertical: spaces.space5)
      ],
    );
  }
}
