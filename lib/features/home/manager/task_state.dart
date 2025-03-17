

import '../data/model/task_model.dart';

abstract class TaskState  {

}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> tasks;

   TaskLoaded(this.tasks);

}

class TaskEmpty extends TaskState {}

class TaskError extends TaskState {
  final String message;

   TaskError(this.message);

  }
