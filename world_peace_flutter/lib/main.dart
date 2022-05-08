import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:world_peace_flutter/appConfig/WPTabBar.dart';
import 'package:world_peace_flutter/modules/Login/LoginPage.dart';
import 'package:world_peace_flutter/tools/utils.dart';

void main() => {
      runApp(const MyApp()),
      _initSVProgressHUD(),
      _initStatusBarD(),
    };

_initSVProgressHUD() {
  SVProgressHUD.setMinimumDismissTimeInterval(2);
  SVProgressHUD.setMinimumSize(const Size(80, 80));
  SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark);
}

_initStatusBarD() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: AppColors.white,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '洛耀生',
      // theme: ThemeData( // 设置整个项目的主题色
      //   primarySwatch: Colors.blue,
      // ),
      // 修改其中想要修改的值
      theme: ThemeData.light().copyWith(
        primaryColor: AppColors.theme,
        cardColor: AppColors.theme,
      ),
//      debugShowCheckedModeBanner: false,
//      home: const LoginPage(),
      home: const WPTabBar(),
    );
  }
}
