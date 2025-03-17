import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/color_app.dart';
import '../../../../../core/utils/image_asset.dart';
import '../../../../../core/widgets_core/btn_widgets.dart';
import '../../../../auth/presentation/views/login_view.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ImageAsset.vectorUrl,
              height: MediaQuery.sizeOf(context).width*0.42,

            ),

            const Text("Welcome To\n \t Do It!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: ColorApp.kBlackColor_2c,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40,),
            const Text("Ready to conquer your tasks? Let's Do \n  It together.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: ColorApp.kBlackColor_7c,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 56,),
            BtnWidgets(text: "Let’s Start",
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginView()),
              );
           },
            ),
          ],
        ),
      ),
    );
  }
}
