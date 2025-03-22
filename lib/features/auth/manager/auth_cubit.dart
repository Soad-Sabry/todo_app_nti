import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/cashe_helper/cache_data.dart';
import '../data/models/user_model.dart';
import '../data/repo/auth_repo.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit._internal() : super(AuthInitialState());

  static final AuthCubit _cubitInstance = AuthCubit._internal();
  factory AuthCubit() => _cubitInstance;

  static AuthCubit get(context) => BlocProvider.of(context);

  // Controllers for TextFields
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
  TextEditingController();

  final AuthRepo authRepo = AuthRepo();

  // Register Function
  void onRegisterPressed() async {
    emit(AuthRegisterLoading());

    if (passwordController.text != passwordConfirmController.text) {
      emit(AuthRegisterError(error: "Passwords do not match!"));
      return;
    }

    var response = await authRepo.register(
      username: usernameController.text,
      password: passwordController.text,
    );

    response.fold(
          (String error) => emit(AuthRegisterError(error: error)),
          (String successMessage) => emit(AuthRegisterSuccess(msg: successMessage)),
    );
  }
  // Login Function
  void onLoginPressed() async {
    emit(AuthLoginLoading());

    var response = await authRepo.login(
      username: usernameController.text,
      password: passwordController.text,
    );


    response.fold((String error) => emit(AuthLoginError(error: error)), (
        UserModel user,
        ) {
      //LocalData.userName = user.username;

      emit(AuthLoginSuccess());
    });
  }
}
