import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo/core/cashe_helper/cache_helper.dart';
import 'package:todo/core/cashe_helper/cache_helper_keys.dart';

import '../../../../core/cashe_helper/cache_data.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';
import '../models/user_model.dart';

class AuthRepo {
  AuthRepo._internal(); // Private constructor
  static final AuthRepo _instance = AuthRepo._internal();

  factory AuthRepo() => _instance;
  APIHelper apiHelper = APIHelper();


  // Register Method
  Future<Either<String, String>> register({
    required String username,
    required String password,
  }) async {
    try {
      ApiResponse apiResponse = await apiHelper.postRequest(
        endPoint: EndPoints.register,
        data: {"username": username, "password": password},
        isAuthorized: false,
      );

      return apiResponse.status
          ? Right(apiResponse.message)
          : Left(apiResponse.message);
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }

  // Login Method
  Future<Either<String, UserModel>> login({
    required String username,
    required String password,
  }) async {
    try {
      ApiResponse apiResponse = await apiHelper.postRequest(
        endPoint: EndPoints.login,
        data: {"username": username, "password": password},
        isAuthorized: false,
      );

      if (apiResponse.status) {
        LoginResponseModel authResponse = LoginResponseModel.fromJson(
          apiResponse.data,
        );

        if (authResponse.user == null) {
          return Left(apiResponse.message);
        }

        // Store Tokens in Local Storage
        LocalData.accessToken = authResponse.accessToken;
        LocalData.refreshToken = authResponse.refreshToken;
        CacheHelper.saveData(key: CacheHelperKeys.accessToken, value: LocalData.accessToken );
        CacheHelper.saveData(key: CacheHelperKeys.refreshToken, value: LocalData.refreshToken );


        return Right(authResponse.user!);
      } else {
        return Left(apiResponse.message);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
