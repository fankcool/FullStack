import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../tools/utils.dart';

wpAppBar(
  BuildContext context,
  String title, {
  bool hiddenLeading = false,
  bool centerTitle = true,
  List<Widget>? actions,
  Function? back,
}) {
  var leading = !hiddenLeading
      ? IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => back == null ? Navigator.pop(context) : back(),
          color: AppColors.theme,
        )
      : null;

  return PreferredSize(
    child: AppBar(
      title: wpText(
        text: title,
        fontSize: centerTitle ? 16 : 26,
        isBold: centerTitle,
        color: AppColors.theme,
      ),
      elevation: 0,
      centerTitle: centerTitle,
      brightness: Brightness.light,
      leading: leading,
      actions: actions,
      backgroundColor: AppColors.white,
    ),
    preferredSize: const Size.fromHeight(44),
  );
}

wpText({
  required String text,
  double fontSize = 18,
  Color color = Colors.black87,
  Color backgroundColor = Colors.transparent,
  TextAlign textAlign = TextAlign.start,
  int? maxLines,
  double? width,
  double? height,
  double left = 0,
  double top = 0,
  double right = 0,
  double bottom = 0,
  EdgeInsets? padding,
  TextOverflow? overflow,
  bool isBold = false,
}) {
  var textStyle = TextStyle(
    color: color,
    fontSize: fontSize,
    decoration: TextDecoration.none,
    fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
  );

  var child = Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow ?? TextOverflow.ellipsis,
    style: textStyle,
  );

  return Container(
    width: width,
    height: height,
    color: backgroundColor,
    padding: padding,
    margin: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
    child: child,
  );
}

wpButton({
  String text = '加入房间',
  double width = 115,
  double height = 40,
  double fontSize = 14,
  EdgeInsetsGeometry? margin,
  double radius = 20,
  bool isBold = false,
  required Function() onPressed,
  Color textColor = Colors.white,
  Color backgroundColor = AppColors.theme,
}) {
  var child = wpText(
    text: text,
    bottom: 2,
    color: textColor,
    fontSize: fontSize,
    isBold: isBold,
  );

  var btn = FlatButton(
    child: child,
    color: backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(radius),
      ),
    ),
    onPressed: onPressed,
  );

  return Container(width: width, height: height, margin: margin, child: btn);
}

wpTextField({
  String? text,
  TextEditingController? controller,
  double width = 230,
  double height = 38,
  EdgeInsetsGeometry? margin,
  EdgeInsetsGeometry? padding,
  double radius = 19,
  FocusNode? focusNode,
  String? hintText,
  TextAlign? textAlign,
  ValueChanged<String>? onChanged,
  List<TextInputFormatter>? inputFormatters,
  TextInputType type = TextInputType.text,
  Function(String value)? onFieldSubmitted,
}) {
  if (controller != null) {
    controller.text = text!;
  }

  var isNull = text == null;

  var style = TextStyle(
    fontSize: 16,
    fontFamily: Constants.iconFontFamily,
    fontWeight: isNull ? FontWeight.w400 : FontWeight.w600,
    color: AppColors.theme,
  );

  var decoration = InputDecoration.collapsed(
    hintText: hintText,
    hintStyle: const TextStyle(
      color: AppColors.theme,
      fontSize: 12,
    ),
  );

  var textFormField = TextFormField(
    enabled: isNull,
    focusNode: focusNode,
    onChanged: onChanged,
    textAlign: textAlign ?? (isNull ? TextAlign.start : TextAlign.center),
    cursorColor: AppColors.themeII,
    textInputAction: defaultTargetPlatform == TargetPlatform.iOS
        ? TextInputAction.join
        : TextInputAction.done,
    onFieldSubmitted: onFieldSubmitted,
    inputFormatters: inputFormatters,
    controller: controller,
    decoration: decoration,
    keyboardType: type,
    style: style,
  );

  return Container(
    width: width,
    height: height,
    alignment: Alignment.center,
    padding:
        padding ?? const EdgeInsets.only(top: 0, left: 10, right: 9, bottom: 0),
    margin: margin ?? const EdgeInsets.only(top: 30),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(
        color: AppColors.divider,
        width: Constants.dividerWidth,
      ),
    ),
    child: textFormField,
  );
}
