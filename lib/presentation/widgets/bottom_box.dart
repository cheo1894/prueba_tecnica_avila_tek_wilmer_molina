import 'dart:io';

import 'package:flutter/material.dart';

class BottomBox extends StatelessWidget {
  final Widget? widget;
  const BottomBox({super.key, this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20, 10, 20, Platform.isAndroid ? 20 : 40),
      color: ThemeData().scaffoldBackgroundColor,

      child: widget,
    );
  }
}
