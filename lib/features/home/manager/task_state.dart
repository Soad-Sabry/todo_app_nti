

import '../data/model/task_model.dart';

abstract class TaskState  {

}
class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<TaskModel> tasks;

   TaskLoaded(this.tasks);

}
class TaskAdded extends TaskState {
  final TaskModel task;
  TaskAdded(this.task);
}

class TaskUpdated extends TaskState {
  final TaskModel task;
  TaskUpdated(this.task);
}

class TaskDeleted extends TaskState {
  final int taskId;
  TaskDeleted(this.taskId);
}

class TaskEmpty extends TaskState {}

class TaskError extends TaskState {
  final String message;

   TaskError(this.message);

  }
