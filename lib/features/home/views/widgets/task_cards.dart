import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/utils/color_app.dart';

class TaskCards extends StatelessWidget {
  final String textTitle;
  final String description;
  final VoidCallback onDelete;

  const TaskCards({
    required this.textTitle,
    required this.description,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => onDelete(),
           // backgroundColor: ColorApp.kBackgroundColor,
            icon: Icons.delete,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0,left: 20,right: 20),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: ColorApp.kGreenLightCard,
          elevation: 5,
          child: ListTile(
            title: Text(
              textTitle,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(description),
          ),
        ),
      ),
    );
  }
}
