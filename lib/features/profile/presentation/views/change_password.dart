import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/localization/app_strings_keys.dart';

import '../../../../core/utils/image_asset.dart';
import '../../../../core/widgets_core/btn_widgets.dart';
import '../../../../generated/l10n.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

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

              // Username Input
              // CustomTextFormField(hintText:AppStrings.oldPassword,controller: ,),
              // const SizedBox(height: 15),
              // CustomTextFormField(hintText:AppStrings.newPassword,controller: ,),
              // const SizedBox(height: 15),
              // CustomTextFormField(hintText:AppStrings.updateProfile,controller: ,),

              BtnWidgets(text: S.of(context).save, onTap:(){}),
            ]
        ),
      ),
    );
  }
}
