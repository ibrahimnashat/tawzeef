import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/objects/job_model.dart';

class SavedItem extends StatelessWidget {
  final JobModel job;
  final Function onTapSave;
  const SavedItem({
    Key? key,
    required this.job,
    required this.onTapSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(end: spaces.space8),
                  width: 9,
                  height: 9,
                  decoration: BoxDecoration(
                    color: job.expired == null
                        ? coolors.primaryColor
                        : coolors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(1.5),
                  margin: EdgeInsetsDirectional.only(end: spaces.space8),
                  decoration: BoxDecoration(
                    color: coolors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: MNetworkImage(
                    url: job.jobCompany!.logo!,
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
                      text: job.jobTitle?.title,
                      fontSize: foontSize.font20,
                      fontColor: coolors.primaryColor,
                      fontFamily: foontFamily.tajawalBold,
                    ),
                    MText(
                      text:
                          "${job.jobCompany?.name} | ${job.state?.state} - ${job.city?.city}",
                      fontColor: coolors.highLight,
                      maxLines: 2,
                      maxWidth: context.w * 0.55,
                      fontSize: foontSize.font16,
                      fontFamily: foontFamily.tajawalRegular,
                    ),
                    MText(
                      text: job.jobType?.jobtype,
                      fontSize: foontSize.font16,
                    ).mPadding(bottom: spaces.space5),
                    MText(
                      text: job.expired == null ? "Avaliable" : "Expired",
                      fontSize: foontSize.font16,
                    ),
                  ],
                )
              ],
            ),
            MSvg(
              name: svgs.saved,
            ).mFlap.mAddAction(onTap: onTapSave)
          ],
        )
            .mAddAction(
              onTap: () => context.push(
                JobScreenDetailsScreen(
                  job: job,
                ),
              ),
            )
            .mPadding(horizontal: spaces.space30),
        Divider(
          endIndent: spaces.space5,
          indent: spaces.space5,
        ).mPadding(vertical: spaces.space5)
      ],
    );
  }
}
