import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../widget/custom_app_bar_widget.dart';

class MypageScreen extends StatefulWidget {

  @override
  _MypageScreenState createState() => _MypageScreenState();
}

class _MypageScreenState extends State<MypageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "마이페이지"),
      body: Container(
        child: Center(
          child: Text('마이페이지'),
        ),
      ),
    );
  }
}