import 'package:tawzeef/shared/consts/exports.dart';

import 'menu_item.dart';

class MyJobItem extends StatelessWidget {
  final JobModel job;
  const MyJobItem({
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
                      maxLines: 2,
                      maxWidth: context.w * 0.54,
                    ),
                    MText(
                      text:
                          "${job.city?.city}  | ${job.state?.state} - ${job.country?.country}",
                      fontSize: foontSize.font16,
                      maxLines: 2,
                      maxWidth: context.w * 0.54,
                    ),
                    MText(
                      text: job.jobType?.jobtype,
                      fontSize: foontSize.font16,
                      fontFamily: foontFamily.tajawalBold,
                      maxLines: 2,
                      maxWidth: context.w * 0.54,
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                MSvg(
                  name: svgs.person,
                )
                    .mAddAction(
                      onTap: () => context.push(
                        JobApplicantsScreen(
                          job: job,
                        ),
                      ),
                    )
                    .mPadding(end: spaces.space12),
                PopMenuItem(
                  onEdit: () => context.push(
                    AddJobScreen(
                      job: job,
                    ),
                  ),
                )
              ],
            )
          ],
        )
            .mAddAction(
              onTap: () => context.push(
                MyJobScreenDetailsScreen(
                  job: job,
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
