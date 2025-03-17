import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/utils/image_asset.dart';
import '../../../core/widgets_core/app_bar_widgets.dart';
import '../../../core/widgets_core/text_style_widget.dart';
import 'add_task.dart';

class HomeNoTasks extends StatelessWidget {
  const HomeNoTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              children: [
                AppBarWidgets(),
                Spacer(),
                IconButton(
                  icon: SvgPicture.asset(ImageAsset.plusIconUrl),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddTask()),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 140),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextStyleWidget(
                text: "There are no tasks yet,\nPress the button \nTo add a New Task",
                fontSize: 16,
              ),
              SizedBox(height: 40),
              SvgPicture.asset(
                ImageAsset.noTaskUrl,
                height: 268,
                width: double.infinity,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
