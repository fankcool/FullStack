import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:world_peace_flutter/appConfig/WPTabBar.dart';
import 'package:world_peace_flutter/customUI/widget.dart';
import 'package:world_peace_flutter/tools/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();

    initView().initData();
  }

  @override
  void dispose() {
    super.dispose();

    prt('*** >>>>> login deinit');
  }

  @override
  Widget build(BuildContext context) {
    var title = wpText(
        text: '登录', isBold: true, fontSize: 15, color: AppColors.dark);

    var loginBtn = wpButton(
        text: '登录',
        isBold: true,
        backgroundColor: AppColors.themeII,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const WPTabBar(),
            ),
          );
        });

    var registerBtn = wpButton(
        text: '注册',
        onPressed: () {
          SVProgressHUD.showInfo(status: '注册');
        });
    var resetBtn = wpButton(
        text: '找回密码',
        onPressed: () {
          SVProgressHUD.showInfo(status: '找回密码');
        });

    var ops = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        registerBtn,
        loginBtn,
        resetBtn,
      ],
    );

    var body = Container(
      color: AppColors.white,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          title,
          ops,
        ],
      ),
    );

    return SafeArea(child: body);
  }

  initData() {
    prt('*** >>> initData');
  }

  initView() {
    prt('*** >>> initView');
    return this;
  }
}
