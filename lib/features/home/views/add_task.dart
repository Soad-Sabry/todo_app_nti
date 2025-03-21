import 'package:flutter/material.dart';
import 'package:todo/core/helper/my_navigator.dart';
import 'package:todo/core/localization/app_strings_keys.dart';
import 'package:todo/features/home/manager/task_cubit.dart';
import 'package:todo/features/home/views/home_view.dart';
import '../../../core/utils/image_asset.dart';
import '../../../core/widgets_core/btn_widgets.dart';
import '../../../core/widgets_core/custom_text_form_field.dart';
import '../../../generated/l10n.dart';
import '../data/model/task_model.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    final taskCubit = TaskCubit.get(context);

    return Scaffold(
      appBar: AppBar(
        title:  Text(S.of(context).titleAddTask),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: 261,
              height: 207,
              child: Image.asset(ImageAsset.flagUrl, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),

            CustomTextFormField(
              hintText: S.of(context).hintTextTitle,
              controller: taskCubit.titleController,
            ),
            const SizedBox(height: 15),

            CustomTextFormField(
              hintText: S.of(context).description,
              controller: taskCubit.descriptionController,
            ),
            const SizedBox(height: 20),

            BtnWidgets(
              text: S.of(context).titleAddTask,
              onTap: () {
                if (taskCubit.titleController.text.isNotEmpty &&
                    taskCubit.descriptionController.text.isNotEmpty) {
                  final newTask = TaskModel(
                    id: DateTime.now().millisecondsSinceEpoch,
                    title: taskCubit.titleController.text,
                    description: taskCubit.descriptionController.text,
                    createdAt: DateTime.now().toString(),
                  );

                  taskCubit.addTask(newTask);
                  Navigator.pop(context, true);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
