import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/home/data/repo/repo_tasks.dart';

import '../data/model/task_model.dart';
import 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepository taskRepository;
  static TaskCubit get(context) => BlocProvider.of(context);

  TaskCubit(this.taskRepository) : super(TaskLoading());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final List<Task> _tasks = [];

  void fetchTasks() {
    if (_tasks.isEmpty) {
      emit(TaskEmpty());
    } else {
      emit(TaskLoaded(List.from(_tasks)));
    }
  }

  void addTask(Task task) {
    _tasks.add(task);
    emit(TaskLoaded(List.from(_tasks)));
  }

  void deleteTask(int id) {
    _tasks.removeWhere((task) => task.id == id);
    if (_tasks.isEmpty) {
      emit(TaskEmpty());
    } else {
      emit(TaskLoaded(List.from(_tasks)));
    }
  }
}
