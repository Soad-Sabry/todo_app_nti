import 'package:flutter/material.dart';

import '../utils/color_app.dart';

// ignore: must_be_immutable
class TextStyleWidget extends StatelessWidget {
  String text;
  double fontSize;
  TextStyleWidget({
    super.key,
    required this.text,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, color: ColorApp.kBlackColor_2c,fontWeight: FontWeight.w300),
    );
  }
}
