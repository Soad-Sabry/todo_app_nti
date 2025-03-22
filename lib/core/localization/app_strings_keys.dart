import 'dart:ui';

import '../cashe_helper/cache_helper_keys.dart';

abstract class AppStringsKeys
{
  static const Locale localeEN = Locale(CacheHelperKeys.keyEN);//'en'
  static const Locale localeAR = Locale(CacheHelperKeys.keyAR);//'ar'
  // RegisterView
  static const String register = 'Register';
  static const String name = 'Name';
  static const String email = 'Email';
  static const String hintUserName = 'User Name';

  static const String password = 'Password';
  static const String passwordConfirm = 'Confirm Password';
  static const haveAccount = 'Already Have An Account?';
  static const noHaveAccount ="Don't Have An Account?";

  // LoginView
  static const String login = 'Login';
  static const String titleAddTask ="Add Task";
  static const String hintTextTitle="Title";
  static const String description  ="Description";
  static const String noTasks="There are no tasks yet,\nPress the button \nTo add a New Task";
  static const String welcome=  "Welcome To\n \t Do It!";
static const String titleOnBoarding ="Ready to conquer your tasks? Let's Do \n  It together.";
 static const String  letsStart="Let’s Start";
static const String updateProfile ="Update Profile";
 static const String oldPassword ="Old  Password";
   static const String newPassword ="New  Password";
  static const String save = "Save";
 static const String changePassword="Change Password";

  static const String setting ="Setting";


}