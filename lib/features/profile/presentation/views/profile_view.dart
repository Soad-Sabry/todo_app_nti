import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/helper/my_navigator.dart';
import 'package:todo/core/localization/app_strings.dart';
import 'package:todo/core/utils/image_asset.dart';
import 'package:todo/features/profile/presentation/views/change_password.dart';
import 'package:todo/features/profile/presentation/views/setting_language_view.dart';
import 'package:todo/features/profile/presentation/views/update_profile.dart';
import 'package:todo/features/profile/presentation/views/wedgits/custom_container.dart';

import '../../../../core/widgets_core/app_bar_widgets.dart';
import '../../../../generated/l10n.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:  Column(
        children: [
          AppBarWidgets(),
      CustomContainer(
        onTap: (){
          MyNavigator.navigateTo(UpdateProfile());

        },
          iconUrl: ImageAsset.rowUrl,
          text: S.of(context).updateProfile),
      CustomContainer(
          onTap: (){
            MyNavigator.navigateTo(ChangePassword());

          },

          iconUrl: ImageAsset.lockUrl,
          text: S.of(context).changePassword),
      CustomContainer(
          onTap: (){
            MyNavigator.navigateTo(SettingLanguageView());

          },

          iconUrl: ImageAsset.settingUrl,
          text: S.of(context).setting),

      ],
      ),

    );
  }
}

