import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/features/home/data/repo/repo_tasks.dart';
import 'package:todo/features/home/views/home_no_task.dart';
import 'package:todo/features/home/views/widgets/task_cards.dart';
import '../../../core/helper/my_navigator.dart';
import '../../../core/utils/image_asset.dart';
import '../../../core/widgets_core/app_bar_widgets.dart';
import '../../profile/presentation/views/profile_view.dart';
import '../manager/task_cubit.dart';
import '../manager/task_state.dart';
import 'add_task.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        print(state.toString());
        if (state is TaskLoading) {
          return const Scaffold(

            body: Center(child: CircularProgressIndicator()),
          );
        } else if(state is TaskError){
          return Scaffold(body: Text("error ${state.message}"),);
        }
        else if (state is TaskEmpty) {
          return const HomeNoTasks();
        } else if (state is TaskLoaded) {
           return Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                      onTap:(){
                        MyNavigator.navigateTo(ProfileView());

                      },
                          child: AppBarWidgets()),
                      Spacer(),
                      IconButton(
                        icon: SvgPicture.asset(ImageAsset.plusIconUrl),
                        onPressed: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddTask()),
                          );
                          if (result == true) {
                            context.read<TaskCubit>().fetchTasks();
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) {
                      final task = state.tasks[index];
                      return TaskCards(
                        textTitle: task.title??'No Title',
                        description: task.description??"No Desc", onDelete: () {
                          TaskCubit.get(context).deleteTask(task.id!);
                      },
                      );
                    },
                  ),
                ),
              ],
            ),
          );

        }
        return Scaffold(
          body: const SizedBox(),
        );
      },
    );
  }
}
