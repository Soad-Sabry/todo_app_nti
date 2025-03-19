import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/localization/app_strings.dart';
import 'package:todo/core/utils/color_app.dart';
import 'package:todo/core/utils/image_asset.dart';

import '../../../../../generated/l10n.dart';

class CustomContainer extends StatelessWidget {
  String iconUrl;
  String text;
  void Function()? onTap;


  CustomContainer({required this.iconUrl,required this.text ,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: ColorApp.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: ColorApp.kBlackColor_2c,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap:onTap ,
            child: Row(
              children: [
                SvgPicture.asset(
                  iconUrl,
                  width: 13,
                  height: 7.437,
                ),
                SizedBox(width: 10),
                Text(S.of(context).updateProfile, style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: ColorApp.kBlackColor_2c)),
              ],
            ),
          ),
          Spacer(),
          SvgPicture.asset(
          ImageAsset.rowUrl,
           width: 13,
           height: 7.437,
          ),
        ],
      ),
    );
  }
}
