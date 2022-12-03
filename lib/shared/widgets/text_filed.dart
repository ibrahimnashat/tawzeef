// ignore_for_file: must_be_immutable

import 'package:tawzeef/shared/consts/exports.dart';

class MTextFiled extends StatelessWidget {
  final TextEditingController? controller;
  final int? maxLength;
  final bool filled;
  final Color? fillColor;
  String? hintText;
  final String? lableText;
  final double textSize;
  final Color hintColor;
  final Color textColor;
  String? fontFamily;
  final double paddingHorizontal;
  final double paddingVertical;
  Widget? suffix;
  Widget? prefix;
  final InputBorder? border;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final int? maxLines;
  final bool obscureText;
  final FocusNode? focusNode;

  MTextFiled({
    Key? key,
    this.controller,
    this.focusNode,
    this.border,
    this.maxLength,
    this.filled = false,
    this.fillColor,
    this.lableText,
    this.suffix,
    this.prefix,
    this.hintText,
    this.fontFamily,
    this.hintColor = const Color(0xff006633),
    this.textColor = Colors.black,
    this.textSize = 20.0,
    this.paddingHorizontal = 0.0,
    this.paddingVertical = 10.0,
    this.enabled = true,
    this.keyboardType = TextInputType.name,
    this.maxLines = 1,
    this.obscureText = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    fontFamily ??= foontFamily.tajawalRegular;
    if (hintText == 'null') hintText = null;
    return TextField(
      focusNode: focusNode,
      key: key,
      enableSuggestions: true,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      controller: controller,
      maxLength: maxLength,
      enabled: enabled,
      onChanged: onChanged,
      keyboardType: keyboardType,
      maxLines: maxLines,
      obscureText: obscureText,
      cursorColor: coolors.primaryColor,
      cursorHeight: textSize,
      style: TextStyle(
        fontSize: textSize,
        color: textColor,
        fontFamily: fontFamily,
      ),
      decoration: InputDecoration(
        focusedBorder: border,
        labelStyle: TextStyle(
          fontSize: textSize,
          color: textColor,
          fontFamily: fontFamily,
        ),
        border: border,
        enabledBorder: border,
        disabledBorder: border,
        suffixIcon: suffix?.mNotStratch,
        prefixIcon: prefix?.mNotStratch,
        filled: filled,
        fillColor: fillColor,
        hintText: hintText,
        labelText: hintText == null || hintText == '' ? lableText : null,
        hintStyle: TextStyle(
          fontSize: textSize,
          color: hintColor,
          fontFamily: fontFamily,
        ),
        contentPadding: EdgeInsetsDirectional.only(
          start: paddingHorizontal,
          end: paddingHorizontal,
          bottom: paddingVertical,
          top: paddingVertical,
        ),
      ),
    );
  }
}
