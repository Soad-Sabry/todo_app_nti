import 'package:flutter/material.dart';

class TaskCardInProgress extends StatelessWidget {
  final String title;

  final String subtitle;
  final Color color;
  final Widget icon;
  final Color colorSubtitle;
  final Color colorTitle;

  TaskCardInProgress({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.icon, required this.colorSubtitle, required this.colorTitle,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 20,right: 0),
      child: Container(
        padding:EdgeInsets.all(16),
        width: 234,
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(color:colorTitle, fontSize: 14,),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: icon,
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(color:colorSubtitle, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
