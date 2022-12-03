// ignore_for_file: must_be_immutable

import '../consts/exports.dart';

class MBouncingButton extends StatelessWidget {
  final String? title;
  Color? textColor;
  double? textSize;
  Function? onTap;
  final double? width;
  final double? height;
  final String? icon;
  dynamic color;
  final double borderRadius;
  final bool iconTransparent;
  MBouncingButton({
    Key? key,
    this.textColor,
    this.textSize,
    this.title = "",
    this.onTap,
    this.height,
    this.width,
    this.color,
    this.borderRadius = 8,
    this.iconTransparent = false,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    textColor ??= coolors.white;
    textSize ??= foontSize.font20;
    color ??= const LinearGradient(
      begin: AlignmentDirectional.topStart,
      end: AlignmentDirectional.bottomEnd,
      colors: [
        Color(0xff678EEE),
        Color(0xffCBD6FF),
      ],
    );
    return BouncingWidget(
      duration: const Duration(milliseconds: 100),
      scaleFactor: 1.5,
      onPressed: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        alignment: Alignment.center,
        width: width ?? 380,
        height: height ?? 65,
        decoration: BoxDecoration(
          color: color is Color ? color : null,
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: color is LinearGradient ? color : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              MSvg(
                name: icon,
                color: iconTransparent ? null : textColor,
                height: 25,
              ).mPadding(end: spaces.space8, bottom: spaces.space5),
            MText(
              text: title,
              textAlign: TextAlign.center,
              fontColor: textColor!,
              fontSize: textSize!,
              fontFamily: foontFamily.tajawalBold,
            ),
          ],
        ),
      ),
    );
  }
}

class MIconButton extends StatelessWidget {
  final String icon;
  Color iconColor;
  Function? onTap;
  final double? width;
  final double? height;
  final Decoration? decoration;
  final double padding;
  final bool stayOnBottom;
  MIconButton({
    Key? key,
    this.iconColor = Colors.black,
    this.icon = "",
    this.onTap,
    this.decoration,
    this.stayOnBottom = false,
    this.height,
    this.width,
    this.padding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      stayOnBottom: stayOnBottom,
      duration: const Duration(milliseconds: 100),
      scaleFactor: 1.5,
      onPressed: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        height: height,
        width: width,
        decoration: decoration,
        alignment: Alignment.center,
        padding: EdgeInsets.all(padding),
        child: MSvg(
          name: icon,
          height: 25,
          width: 25,
          color: iconColor,
        ),
      ),
    );
  }
}
