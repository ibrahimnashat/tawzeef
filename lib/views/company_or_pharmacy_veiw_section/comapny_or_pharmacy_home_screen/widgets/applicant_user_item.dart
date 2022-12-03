import 'package:tawzeef/shared/consts/exports.dart';

class ApplicantUserItem extends StatelessWidget {
  final UserModel user;
  const ApplicantUserItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                url: user.image ?? '',
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
                  text: user.name,
                  fontSize: foontSize.font22,
                  fontColor: coolors.primaryColor,
                  fontFamily: foontFamily.tajawalBold,
                ),
                MText(
                  text: user.education?.degreeType,
                  fontSize: foontSize.font18,
                  fontColor: coolors.primaryColor,
                  fontFamily: foontFamily.tajawalBold,
                ),
                MText(
                  text: user.education?.endYear?.yearMonthDay,
                  fontSize: foontSize.font18,
                ),
                MText(
                  text: "${user.state?.state}, ${user.country?.country}",
                  fontSize: foontSize.font18,
                  maxLines: 2,
                  maxWidth: context.w * 0.63,
                ),
              ],
            )
          ],
        )
            .mAddAction(
              onTap: () => context.push(
                ApplicantScreen(
                  user: user,
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
