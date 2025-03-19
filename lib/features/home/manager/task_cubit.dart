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


  void fetchTasks() async {
    emit(TaskLoading());
    try {
      final tasks = await taskRepository.fetchTasks();
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  void addTask(Task task) async {
    emit(TaskLoading()); //  Show loading before request
    try {
      final newTask = await taskRepository.addTask(task);
      emit(TaskAdded(newTask)); //  Success state
      fetchTasks(); //  Refresh tasks after adding
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  void deleteTask(int taskId) async {
    emit(TaskLoading()); //  Show loading before request
    try {
      await taskRepository.deleteTask(taskId);
      emit(TaskDeleted(taskId)); //  Success state
      fetchTasks();
      emit(TaskLoading()); //  Refresh tasks after deletion
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  void updateTask(Task task) async {
    emit(TaskLoading()); //  Show loading before request
    try {
      final updatedTask = await taskRepository.updateTask(task);
      emit(TaskUpdated(updatedTask)); //  Success state
      fetchTasks(); //  Refresh tasks after update
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }
}
