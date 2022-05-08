import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_peace_flutter/customUI/widget.dart';

import '../tools/utils.dart';

enum Operation { notice, edit }

class WPAlertDialog extends Dialog {
  final String title;
  final String message;

  final double msgFontSize;

  final Operation type;

  final bool isLandscape;

  final String cancelText;
  final String confirmText;

  final bool isNeedCancel;

  final TextAlign textAlign;

  final VoidCallback? cancel;
  final void Function(String)? confirm;

  // ignore: prefer_typing_uninitialized_variables
  final alertDialogHeight;

  final TextEditingController? textEditingController;

  final List<TextInputFormatter>? inputFormatters;

  final TextInputType textInputType;

  final String hintText;

  const WPAlertDialog({
    Key? key,
    this.title = '',
    this.message = '',
    this.msgFontSize = 13,
    this.isLandscape = false,
    this.isNeedCancel = true,
    this.cancelText = '',
    this.confirmText = '',
    this.type = Operation.notice,
    this.textEditingController,
    this.textAlign = TextAlign.center,
    this.alertDialogHeight = 250.0,
    this.cancel,
    this.confirm,
    this.inputFormatters,
    this.textInputType = TextInputType.text,
    this.hintText = '编辑笔记名称',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final padding =
        (MediaQuery.of(context).size.height - alertDialogHeight) / 2 - 10;

    final child = Material(
      type: MaterialType.transparency,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _renderContent(context),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 5,
              left: 30,
              right: 30,
            ),
          ),
        ],
      ),
    );

    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * (isLandscape ? 0.3 : 0.1),
        right: screenWidth * (isLandscape ? 0.3 : 0.1),
        top: padding - 45,
        bottom: padding + 45,
      ),
      child: child,
    );
  }

  Widget _renderContent(BuildContext context) {
    if (textEditingController != null) {
      var textSelection = TextSelection(
          baseOffset: 0, extentOffset: textEditingController!.text.length);
      textEditingController!.selection = textSelection;
    }

    final needCancel = Expanded(
      flex: 3,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          if (cancel != null) cancel!();
        },
        child: Container(
          height: 35,
          decoration: const BoxDecoration(
            color: AppColors.cancel,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Center(
            child: wpText(
              text: cancelText.isNotEmpty ? cancelText : '取消',
              isBold: true,
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );

    final expanded = Expanded(
      flex: isNeedCancel ? 3 : 1,
      child: GestureDetector(
        onTap: () {
          if (confirm == null) {
            Navigator.pop(context);
            return;
          }

          if (textEditingController != null) {
            if (textEditingController!.text.isNotEmpty) {
              Navigator.pop(context);
            }
          } else {
            Navigator.pop(context);
          }

          textEditingController == null
              ? confirm!('')
              : confirm!(textEditingController!.text);

          textEditingController?.text = "";
        },
        child: Container(
          height: 35,
          decoration: const BoxDecoration(
            color: AppColors.theme,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Center(
            child: wpText(
              text: confirmText.isNotEmpty ? confirmText : '确定',
              isBold: true,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

    final row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        if (isNeedCancel)
          const Spacer(
            flex: 1,
          ),
        if (isNeedCancel) needCancel,
        const Spacer(
          flex: 1,
        ),
        expanded,
        const Spacer(
          flex: 1,
        )
      ],
    );

    List<Widget> list = [
      wpText(text: title, isBold: true, color: AppColors.theme, fontSize: 18),
      if (type == Operation.edit && message.isNotEmpty)
        wpText(
          text: message,
          isBold: false,
          color: Colors.black87,
          textAlign: textAlign,
          fontSize: 11,
          maxLines: 3,
          top: message.isEmpty ? 0 : 15,
          left: 10,
          right: 10,
          bottom: 10,
        ),
      type == Operation.notice
          ? wpText(
              text: message,
              isBold: false,
              color: Colors.black87,
              textAlign: textAlign,
              fontSize: msgFontSize,
              maxLines: 3,
              top: message.isEmpty ? 0 : 25,
              left: 50,
              right: 50,
              bottom: 35,
            )
          : wpTextField(
              height: 35,
              type: textInputType,
              hintText: hintText,
              margin: const EdgeInsets.only(top: 15, bottom: 22),
              controller: textEditingController,
              inputFormatters: inputFormatters,
              radius: 12,
            ),
      row,
    ];

    return Container(
      height: alertDialogHeight - 75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: list,
      ),
    );
  }
}
