import 'package:tawzeef/shared/consts/exports.dart';

enum Types { apply, reject, inreview }

class MyApplicationItem extends StatelessWidget {
  final JobModel job;
  const MyApplicationItem({
    Key? key,
    required this.job,
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
                  padding: const EdgeInsets.all(1.5),
                  margin: EdgeInsetsDirectional.only(end: spaces.space8),
                  decoration: BoxDecoration(
                    color: coolors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: MNetworkImage(
                    url: job.jobCompany?.logo ?? '',
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
                      text: DateTime.tryParse(job.createdAt!)?.monthAndDay,
                      fontSize: foontSize.font16,
                    ).mPadding(bottom: spaces.space5),
                    MText(
                      text: job.status,
                      fontSize: foontSize.font16,
                    ),
                  ],
                )
              ],
            ),
            if (job.status == 'apply')
              MSvg(
                name: svgs.correctCheck,
                color: coolors.primaryColor,
              )
            else if (job.status == 'inreview')
              MSvg(
                name: svgs.fillInReview,
              )
            else if (job.status == 'reject')
              MSvg(
                name: svgs.reject,
              )
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
