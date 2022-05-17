import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

import '../../customUI/WPAlertDialog.dart';
import '../../customUI/widget.dart';
import '../../tools/utils.dart';
import 'DetailPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var success = GestureDetector(
      child: wpText(
        text: 'success',
        fontSize: 16,
        bottom: 100,
        height: 50,
        isBold: true,
        color: Colors.orangeAccent,
      ),
      onTap: () => SVProgressHUD.showSuccess(status: 'send success'),
    );

    var fail = GestureDetector(
      child: wpText(
        text: 'fail',
        fontSize: 16,
        height: 50,
        isBold: true,
        color: AppColors.theme,
      ),
      onTap: () => showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => WPAlertDialog(
          title: '标题',
          textAlign: TextAlign.center,
          message: '消息内容消息内容消息内容',
          cancel: () {},
          confirm: (_) => SVProgressHUD.showInfo(status: 'confirm'),
        ),
      ),
    );

    var push = GestureDetector(
      child: wpText(
        text: 'push to detail',
        fontSize: 16,
        height: 50,
        top: 100,
        isBold: true,
        color: AppColors.themeII,
      ),
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const DetailPage(
              detailId: 123,
            ),
          ),
        );
      },
    );

    var ops = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        success,
        fail,
        push,
      ],
    );

    var body = SizedBox(
      width: double.infinity,
      child: ops,
    );

    return Scaffold(
      appBar: wpAppBar(context, '首页', hiddenLeading: true),
      body: body,
    );
  }
}
