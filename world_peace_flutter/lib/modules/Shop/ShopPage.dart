import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

import '../../customUI/widget.dart';
import '../../tools/utils.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    var success = GestureDetector(
      child: wpText(
        text: 'Shop',
        fontSize: 20,
        isBold: true,
        color: AppColors.themeII,
      ),
      onTap: () => SVProgressHUD.showInfo(status: '商城'),
    );

    var ops = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        success,
      ],
    );

    var body = SizedBox(
      width: double.infinity,
      child: ops,
    );

    return Scaffold(
      appBar: wpAppBar(context, '商城', hiddenLeading: true),
      body: body,
    );
  }
}
