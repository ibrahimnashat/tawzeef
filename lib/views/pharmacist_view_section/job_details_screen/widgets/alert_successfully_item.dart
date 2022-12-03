import 'package:tawzeef/shared/consts/exports.dart';

class AlertSuccesfullyItem extends StatelessWidget {
  final bool isApply;
  const AlertSuccesfullyItem({
    Key? key,
    required this.isApply,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0.0,
      contentPadding: EdgeInsets.all(spaces.space35),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(35),
        borderSide: BorderSide.none,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MSvg(
            name: svgs.correctCheck,
            color: isApply ? const Color(0xff73D214) : coolors.red,
            width: 100,
            height: 100,
          ).mPadding(all: spaces.space12),
          MText(
            text: isApply
                ? "You have successfully applied !"
                : "You have canceling successfully !",
            fontColor: coolors.highLight,
            fontSize: foontSize.font26,
            fontFamily: foontFamily.tajawalBold,
            textAlign: TextAlign.center,
            maxLines: 2,
            maxWidth: 300,
          ),
        ],
      ),
    );
  }
}
