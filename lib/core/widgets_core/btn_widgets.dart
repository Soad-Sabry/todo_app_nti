
import 'package:flutter/material.dart';

import '../utils/color_app.dart';

// ignore: must_be_immutable
class BtnWidgets  extends StatelessWidget {
 final String text;
 void Function()? onTap;
   BtnWidgets({super.key,required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 22,right: 22),

          alignment: Alignment.center,
          width: double.infinity,
        height: 48.01,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),

            color:ColorApp.kGreen,
          boxShadow: [
            BoxShadow(
              color: ColorApp.kGreen,
              blurRadius: 10,
              offset: Offset(0, 5),

            ),
                   ]
        ),
          child: Text(text,
            style: TextStyle(
              color: ColorApp.white,
              fontSize: 19,
              fontWeight: FontWeight.w300,
            ),)

      ),
    );
  }
}
