import 'package:bookia/features/auth/data/models/login_request_model.dart';
import 'package:bookia/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';

import '../models/register_request_model.dart';

class AuthRemoteDataSource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.codingarabic.online/api/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  Future<UserModel> register(RegisterRequestModel request) async {
    try {
      FormData formData = FormData.fromMap(request.addRegisterDataToMap());
      final response = await _dio.post(
        "auth/register",
        data: formData,
        options: Options(headers: {'Accept': 'application/json'}),
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<UserModel> login(LoginRequestModel request) async {
    try {
      FormData formData = FormData.fromMap(request.addLoginDataToMap());
      final response = await _dio.post(
        "auth/login",
        data: formData,
        options: Options(headers: {'Accept': 'application/json'}),
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Exception _handleDioError(DioException e) {
    if (e.response != null) {
      return Exception(
        e.response?.data['message'] ??
            'Something wrong was happened please make sure u entered the correct data',
      );
    }
    return Exception("Connection Error");
  }
}
