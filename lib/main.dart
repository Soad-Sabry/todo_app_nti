import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/core/network/api_helper.dart';
import 'package:todo/core/utils/color_app.dart';
import 'package:todo/features/auth/manager/auth_cubit.dart';
import 'package:todo/features/home/views/home_view.dart';

import 'features/home/data/repo/repo_tasks.dart';
import 'features/home/manager/task_cubit.dart';
import 'features/onboarding/presentation/views/splash_view.dart';
import 'generated/l10n.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});
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
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,

      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
           fontFamily: "Lexend Deca",
        //  cardTheme: ColorApp.kBackgroundColor
      ),
      home: isLoggedIn ? const HomeView() : const SplashView(),
      //const MyHomePage(title: 'Flutter Demo Home Page'),
    ),
),
);
  }
}


