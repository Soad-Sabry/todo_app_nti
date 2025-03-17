import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/utils/image_asset.dart';
import 'package:todo/features/profile/presentation/views/wedgits/custom_container.dart';

import '../../../../core/widgets_core/app_bar_widgets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:  Column(
        children: [
          AppBarWidgets(),
      CustomContainer(iconUrl: ImageAsset.rowUrl, text: "Update Profile"),
      CustomContainer(iconUrl: ImageAsset.lockUrl, text: "Change Password"),
      CustomContainer(iconUrl: ImageAsset.settingUrl, text: " Setting"),

      ],
      ),

    );
  }
}

