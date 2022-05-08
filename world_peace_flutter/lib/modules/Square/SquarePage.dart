import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

import '../../customUI/widget.dart';

class SquarePage extends StatefulWidget {
  const SquarePage({Key? key}) : super(key: key);

  @override
  _SquarePageState createState() => _SquarePageState();
}

class _SquarePageState extends State<SquarePage> {
  @override
  Widget build(BuildContext context) {
    var success = GestureDetector(
      child: wpText(
        text: 'Square',
        fontSize: 20,
        isBold: true,
        color: Colors.orangeAccent,
      ),
      onTap: () => SVProgressHUD.showInfo(status: '广场'),
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
      appBar: wpAppBar(context, '广场', hiddenLeading: true),
      body: body,
    );
  }
}
