import 'package:tawzeef/shared/consts/exports.dart';

class JobOfferItem extends StatelessWidget {
  final JobModel job;
  const JobOfferItem({
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
                  margin: EdgeInsetsDirectional.only(end: spaces.space12),
                  decoration: BoxDecoration(
                    color: coolors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: MNetworkImage(
                    url: job.jobCompany?.logo ?? '',
                    fit: BoxFit.cover,
                    borderRadius: 100,
                    height: 100,
                    width: 100,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MText(
                      text: job.jobTitle?.title,
                      fontSize: foontSize.font22,
                      fontColor: coolors.primaryColor,
                      fontFamily: foontFamily.tajawalBold,
                    ),
                    MText(
                      text:
                          "${job.jobCompany?.name} | ${job.state?.state} - ${job.city?.city}",
                      fontSize: foontSize.font18,
                      fontColor: coolors.highLight,
                      maxLines: 2,
                      maxWidth: context.w * 0.55,
                    ).mPadding(vertical: spaces.space2),
                    MText(
                      text: job.jobType?.jobtype,
                      fontSize: foontSize.font18,
                      fontFamily: foontFamily.tajawalBold,
                    ),
                  ],
                ),
              ],
            ),
            MSvg(
              name: svgs.back,
            ).mFlapEn
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
