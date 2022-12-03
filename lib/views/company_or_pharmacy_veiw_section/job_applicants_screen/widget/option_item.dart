import 'package:tawzeef/shared/consts/exports.dart';

class OptionItem extends StatelessWidget {
  final String? title;
  final String? count;
  final bool selected;
  const OptionItem({
    Key? key,
    required this.title,
    this.count,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: spaces.space12),
      padding: EdgeInsets.symmetric(
        horizontal: spaces.space21,
        vertical: spaces.space12,
      ),
      decoration: BoxDecoration(
        color: coolors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: coolors.white),
      ),
      child: Row(
        children: [
          MText(
            text: title,
            fontColor: coolors.primaryColor,
            fontFamily:
                selected ? foontFamily.tajawalBold : foontFamily.tajawalRegular,
            fontSize: foontSize.font18,
          ),
          if (count != null)
            Container(
              width: 20,
              height: 20,
              alignment: Alignment.center,
              margin: EdgeInsetsDirectional.only(start: spaces.space12),
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
      ),
    );
  }
}
