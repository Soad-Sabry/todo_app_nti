import 'package:dio/dio.dart';
import 'package:todo/core/network/api_helper.dart';
import 'package:todo/core/network/end_points.dart';

import '../model/task_model.dart';


class TaskRepository {
  final  APIHelper apiHelper;

  TaskRepository(this.apiHelper);


  final String baseUrl = "https://nti-production.up.railway.app/api/";

  Future<List<Task>> fetchTasks() async {
    try {
      final response = await apiHelper.getRequest(endPoint: EndPoints.getTasks);
      List<Task> tasks = (response.data as List).map((json) => Task.fromJson(json)).toList();
      return tasks;
    } catch (e) {
      throw Exception("Fail");
    }
  }

  Future<void> addTask(Task task) async {
    try {
      await apiHelper.postRequest(endPoint: EndPoints.newTask, data: task.toJson());
    } catch (e) {
      throw Exception("Fail");
    }
  }

  Future<void> deleteTask(int id) async {
    try {
      await apiHelper.deleteRequest(endPoint: EndPoints.deleteTask);
    } catch (e) {
      throw Exception("Fail");
    }
  }
}
