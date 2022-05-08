import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

import '../../customUI/widget.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    var success = GestureDetector(
      child: wpText(
        text: 'Mine',
        fontSize: 20,
        isBold: true,
        color: Colors.purple,
      ),
      onTap: () => SVProgressHUD.showInfo(status: '我的'),
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
      appBar: wpAppBar(context, '我的', hiddenLeading: true),
      body: body,
    );
  }
}
