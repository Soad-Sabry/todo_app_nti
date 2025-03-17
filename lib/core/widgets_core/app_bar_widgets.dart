
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/widgets_core/text_style_widget.dart';
import '../utils/image_asset.dart';

class AppBarWidgets extends StatelessWidget {
  AppBarWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 196,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 60,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(ImageAsset.flagUrl),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextStyleWidget(text: "Hello", fontSize: 12),

               TextStyleWidget(text: "", fontSize: 16)

              ],
            ),
          ],
        ),
      ),
    );
  }
}
