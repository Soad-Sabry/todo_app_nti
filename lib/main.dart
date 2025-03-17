import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo/core/network/api_helper.dart';
import 'package:todo/core/utils/color_app.dart';
import 'package:todo/features/auth/manager/auth_cubit.dart';
import 'package:todo/features/home/views/home_view.dart';

import 'features/home/data/repo/repo_tasks.dart';
import 'features/home/manager/task_cubit.dart';
import 'features/onboarding/presentation/views/splash_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AuthCubit(),
  child:     MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => TaskCubit(TaskRepository(APIHelper()))..fetchTasks()),
    ],

    child: GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
           fontFamily: "Lexend Deca",
        //  cardTheme: ColorApp.kBackgroundColor
      ),
      home:const SplashView(),

      //const MyHomePage(title: 'Flutter Demo Home Page'),
    ),
),
);
  }
}


