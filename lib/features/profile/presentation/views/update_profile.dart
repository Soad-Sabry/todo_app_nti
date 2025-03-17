import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/localization/app_strings.dart';

import '../../../../core/utils/image_asset.dart';
import '../../../../core/widgets_core/btn_widgets.dart';
import '../../../../core/widgets_core/custom_text_form_field.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: Column(
      children: [
      SizedBox(
      width: double.infinity,
      child: Image.asset(ImageAsset.logoUrl, fit: BoxFit.cover),
    ),
    const SizedBox(height: 20),

  //  CustomTextFormField(hintText:"User Name",controller: ,),
    const SizedBox(height: 15),

    BtnWidgets(text: AppStrings.updateProfile, onTap:(){}),
    ]
    ),
    ),
    );
  }
}
