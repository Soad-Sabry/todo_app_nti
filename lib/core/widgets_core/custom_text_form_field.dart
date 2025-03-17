import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/color_app.dart';

class CustomTextFormField extends StatelessWidget {
  String hintText;
  final TextEditingController controller ;


  CustomTextFormField( {super.key,required this.hintText, required this.controller,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: ColorApp.kBlackColor_7c,
            fontSize: 14,
          ),

          filled: true,
          fillColor: ColorApp.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
