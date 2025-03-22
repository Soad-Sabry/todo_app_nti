import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/cashe_helper/cache_data.dart';
import 'package:todo/core/cashe_helper/cache_helper.dart';
import 'package:todo/core/cashe_helper/cache_helper_keys.dart';
import 'package:todo/core/utils/color_app.dart';
import 'package:todo/features/home/views/home_view.dart';

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
              LocalData.accessToken = CacheHelper.getData(key: CacheHelperKeys.accessToken);
      if(LocalData.accessToken==null)
      {
        MyNavigator.navigateTo(OnboardingView());
      }
      else
      {
        MyNavigator.navigateTo(HomeView());
      }

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
