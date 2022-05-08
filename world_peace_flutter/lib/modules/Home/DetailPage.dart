import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

import '../../customUI/widget.dart';
import '../../tools/utils.dart';

class DetailPage extends StatefulWidget {
  final int detailId;

  const DetailPage({Key? key, required this.detailId}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();

    prt('detailPage detailId: ${widget.detailId}');
  }

  @override
  Widget build(BuildContext context) {
    var img = GestureDetector(
      child: Container(
        width: 40,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Image.asset(
          'assets/images/home_sel.png',
          color: AppColors.theme,
        ),
      ),
      onTap: () => SVProgressHUD.showInfo(status: 'img click'),
    );

    var save = GestureDetector(
      child: wpText(
        text: '保存',
        fontSize: 13,
        left: 2,
        right: 8,
        color: AppColors.theme,
        padding: const EdgeInsets.only(top: 12, left: 3, right: 3),
      ),
      onTap: () => SVProgressHUD.showInfo(status: 'save'),
    );

    var success = GestureDetector(
      child: wpText(
        text: 'DetailPage',
        fontSize: 18,
        isBold: true,
        color: AppColors.theme,
      ),
      onTap: () {},
    );

    var body = SizedBox(
      width: double.infinity,
      child: Center(child: success),
    );

    return Scaffold(
      appBar: wpAppBar(
        context,
        '详情',
        actions: [
          img,
          save,
        ],
      ),
      body: body,
    );
  }
}
