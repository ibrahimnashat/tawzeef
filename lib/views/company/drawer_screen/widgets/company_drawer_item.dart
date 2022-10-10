import 'package:tawzeef/controller/consts/exports.dart';

class CompanyDrawerItem extends StatelessWidget {
  final String? title;
  final String icon;
  final String? count;
  final Function onTap;
  const CompanyDrawerItem({
    Key? key,
    this.icon = "",
    this.title = "",
    this.count,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  alignment: AlignmentDirectional.topStart,
                  width: 45,
                  child: MSvg(
                    name: icon,
                    color: coolors.primaryColor,
                  ),
                ),
                MText(
                  text: title,
                  fontColor: coolors.black,
                  fontFamily: foontFamily.tajawalRegular,
                  fontSize: foontSize.font18,
                ),
              ],
            ),
            if (count != null)
              Container(
                padding: EdgeInsets.all(spaces.space5),
                decoration: BoxDecoration(
                  color: coolors.red,
                  shape: BoxShape.circle,
                ),
                child: MText(
                  text: count,
                  fontColor: coolors.white,
                  fontFamily: foontFamily.tajawalRegular,
                  fontSize: foontSize.font12,
                ),
              )
          ],
        ).mAddAction(onTap: onTap),
        Divider(
          endIndent: spaces.space5,
          indent: spaces.space5,
        ).mPadding(vertical: spaces.space12)
      ],
    );
  }
}
