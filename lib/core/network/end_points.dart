abstract class EndPoints {
  static const String baseUrl = "https://nti-production.up.railway.app/api/";

  static const String register = "register";
  static const String login = "login";
  static const String getUserProfile = "get_user_data";
  static const String getTasks = "my_tasks";
  static const String newTask = "new_task";
  static const String deleteTask = "tasks";
  static const String updateTask = "tasks";
  static const String updateUserProfile = "update_profile";
  static const String changePassword = "change_password";
  static const String refreshToken = "$baseUrl/auth/refresh-token";

}