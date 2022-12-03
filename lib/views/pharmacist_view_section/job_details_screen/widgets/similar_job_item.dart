import 'package:tawzeef/shared/consts/exports.dart';

class SimilarJobItem extends StatelessWidget {
  const SimilarJobItem({Key? key}) : super(key: key);

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
                  child: const MNetworkImage(
                    url:
                        "https://media.istockphoto.com/photos/programmer-working-with-program-code-picture-id1075599562?k=20&m=1075599562&s=612x612&w=0&h=cDFY2kKyhFzSNNlDQsaxoekIW0v7iyaMBkxp11Fz33U=",
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
                      text: "Senior UI Design",
                      fontSize: foontSize.font22,
                      fontColor: coolors.primaryColor,
                      fontFamily: foontFamily.tajawalBold,
                    ),
                    MText(
                      text: "Abn Elkhasieb  | Cairo - Egypt",
                      fontSize: foontSize.font18,
                      fontColor: coolors.highLight,
                    ).mPadding(vertical: spaces.space2),
                    MText(
                      text: "Full Time",
                      fontSize: foontSize.font18,
                      fontFamily: foontFamily.tajawalBold,
                    ),
                  ],
                ),
              ],
            ),
            MSvg(
              name: svgs.back,
            ).mFlap
          ],
        ).mAddAction(onTap: () => context.push(JobScreenDetailsScreen())),
        Divider(
          endIndent: spaces.space5,
          indent: spaces.space5,
        ).mPadding(vertical: spaces.space5)
      ],
    );
  }
}
