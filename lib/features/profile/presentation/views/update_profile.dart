import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/image_asset.dart';
import '../../../../core/widgets_core/btn_widgets.dart';
import '../../../../core/widgets_core/custom_text_form_field.dart';
import '../../../../generated/l10n.dart';

class UpdateProfile extends StatelessWidget {
   UpdateProfile({super.key});
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: Column(
      children: [
      SizedBox(
      width: double.infinity,
      child: Image.asset(ImageAsset.flagUrl, fit: BoxFit.cover),
    ),
    const SizedBox(height: 20),

   CustomTextFormField(hintText:"User Name",controller:controller ),
    const SizedBox(height: 15),

    BtnWidgets(text: S.of(context).updateProfile, onTap:(){}),
    ]
    ),
    ),
    );
  }
}
