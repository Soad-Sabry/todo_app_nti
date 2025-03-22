import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/helper/my_navigator.dart';
import 'package:todo/core/utils/image_asset.dart';
import 'package:todo/features/profile/presentation/views/change_password.dart';
import 'package:todo/features/profile/presentation/views/update_profile.dart';
import 'package:todo/features/profile/presentation/views/wedgits/custom_container.dart';
import 'package:todo/features/profile/presentation/views/setting_language_view.dart';

import '../../../../core/localization/app_strings_keys.dart';
import '../../../../core/widgets_core/app_bar_widgets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:  Column(
       mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBarWidgets(),
      CustomContainer(
        onTap: (){
          MyNavigator.navigateTo(UpdateProfile());

        },
          iconUrl: ImageAsset.rowUrl,
          text: AppStringsKeys.updateProfile.tr),
      CustomContainer(
          onTap: (){
            MyNavigator.navigateTo(ChangePassword());

          },

          iconUrl: ImageAsset.lockUrl,
          text: AppStringsKeys.changePassword.tr),
      CustomContainer(
          onTap: (){
            MyNavigator.navigateTo(SettingLanguageView());

          },

          iconUrl: ImageAsset.settingUrl,
          text: AppStringsKeys.setting.tr),

      ],
      ),

    );
  }
}

