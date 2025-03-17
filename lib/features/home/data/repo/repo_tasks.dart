import 'package:dio/dio.dart';

import '../model/task_model.dart';


class TaskRepository {
  static final TaskRepository _instance = TaskRepository._internal();
  TaskRepository._internal();
  factory TaskRepository() {
    return _instance;
  }


  final Dio _dio = Dio();
  final String baseUrl = "https://nti-production.up.railway.app/api/";

  Future<List<Task>> fetchTasks() async {
    try {
      final response = await _dio.get("$baseUrl/my_tasks");
      List<Task> tasks = (response.data as List).map((json) => Task.fromJson(json)).toList();
      return tasks;
    } catch (e) {
      throw Exception("Fail");
    }
  }

  Future<void> addTask(Task task) async {
    try {
      await _dio.post("$baseUrl/new_task", data: task.toJson());
    } catch (e) {
      throw Exception("Fail");
    }
  }

  Future<void> deleteTask(int id) async {
    try {
      await _dio.delete("$baseUrl/tasks/$id");
    } catch (e) {
      throw Exception("Fail");
    }
  }
}
