
import 'package:dartz/dartz.dart';
import 'package:todo/core/network/api_response.dart';
import 'package:todo/features/home/data/model/task_model.dart';

import '../../../../core/cashe_helper/cache_data.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/end_points.dart';

class TaskRepository {
  final APIHelper apiHelper;

  TaskRepository(this.apiHelper);

  Future<Either<String, List<TaskModel>>> fetchTasks() async {
    try {
      ApiResponse response = await apiHelper.getRequest(endPoint: EndPoints.getTasks);
      if(response.status)
      {
        GetTasksResponseModel getTasksResponseModel = GetTasksResponseModel.fromJson(response.data);
        if(getTasksResponseModel.tasks!= null)
        {
          return Right(getTasksResponseModel.tasks!);
        }
        else
        {
          return Left("Error fetching tasks");
        }
      }
      else
      {
        return Left(response.message);
      }

      // if (response.statusCode == 200 && response.data['status'] == true) {
      //   List tasks = response.data['tasks'];
      //   return tasks.map((task) => Task.fromJson(task)).toList();
      // } else {
      //   throw Exception("Failed to fetch tasks");
      // }
    } catch (e) {
      throw Exception("Error fetching tasks: ${e.toString()}");
    }
  }

  Future<TaskModel> addTask(TaskModel task) async {
    try {
      final response = await apiHelper.postRequest(
        endPoint: EndPoints.newTask,
        data: task.toJson(),
      );

      if (response.statusCode == 201) {
        return TaskModel.fromJson(response.data);
      } else {
        throw Exception("Failed to add task");
      }
    } catch (e) {
      throw Exception("Error adding task: ${e.toString()}");
    }
  }

  Future<TaskModel> updateTask(TaskModel task) async {
    try {
      final response = await apiHelper.putRequest(
        endPoint: EndPoints.updateTask,
        data: task.toJson(),
      );

      if (response.statusCode == 200) {
        return TaskModel.fromJson(response.data);
      } else {
        throw Exception("Failed to update task");
      }
    } catch (e) {
      throw Exception("Error updating task: ${e.toString()}");
    }
  }

  Future<void> deleteTask(int taskId) async {
    print("Attempting to delete task with ID: $taskId");

    try {
      final response = await apiHelper.deleteRequest(
        endPoint: "${EndPoints.deleteTask}/$taskId",
        headers: {
          "Authorization":
          "Bearer ${LocalData.accessToken}",
        },
      );

      if (response.statusCode != 200) {
        throw Exception("Failed to delete task");
      }
    } catch (e) {
      throw Exception("Error deleting task: ${e.toString()}");
    }
  }
}
