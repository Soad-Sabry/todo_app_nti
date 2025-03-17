import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/utils/color_app.dart';

import '../../../../core/constans/app_constants.dart';
import '../../../../core/helper/my_navigator.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/image_asset.dart';
import 'onboarding_view.dart';


class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),
            (){
      MyNavigator.navigateTo(OnboardingView());

    }
    );
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(ImageAsset.logoUrl),
          SizedBox(height: AppSize.h45),
          Text(AppConstans.nameApp,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorApp.kGreen,
              fontWeight: FontWeight.bold,
              fontSize: 63,


            ),
          ),
        ],
      ),
    );
  }
}
