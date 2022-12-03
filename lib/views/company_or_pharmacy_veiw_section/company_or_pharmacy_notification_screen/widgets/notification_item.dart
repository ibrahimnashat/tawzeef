import 'package:tawzeef/shared/consts/exports.dart';

class NotificationItem extends StatelessWidget {
  final NotificactionModel notificaction;
  const NotificationItem({
    Key? key,
    required this.notificaction,
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
                    url: notificaction.user?.image ?? '',
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
                      text: notificaction.title,
                      fontSize: foontSize.font20,
                      fontColor: coolors.primaryColor,
                      fontFamily: foontFamily.tajawalBold,
                    ),
                    MText(
                      text:
                          "${notificaction.user?.name} ${notificaction.message}",
                      fontSize: foontSize.font16,
                      fontFamily: foontFamily.tajawalRegular,
                      maxWidth: context.w * 0.6,
                      maxLines: 3,
                    ),
                    MText(
                      text: notificaction.user?.education?.degreeType,
                      fontSize: foontSize.font16,
                    ),
                  ],
                )
              ],
            ),
            MSvg(
              name: svgs.back,
            ).mFlapEn
          ],
        ).mAddAction(
          onTap: () {
            if (notificaction.user != null) {
              context.push(
                ApplicantScreen(
                  user: notificaction.user,
                ),
              );
            }
          },
        ).mPadding(horizontal: spaces.space30),
        Divider(
          endIndent: spaces.space5,
          indent: spaces.space5,
        ).mPadding(vertical: spaces.space5)
      ],
    );
  }
}
