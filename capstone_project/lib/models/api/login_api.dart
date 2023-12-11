// ignore_for_file: nullable_type_in_catch_clause, deprecated_member_use

import 'package:capstone_project/models/login_model.dart';
import 'package:dio/dio.dart';

class SignInService {
  final Dio _dio = Dio();

  Future<LoginModel> signInAccount({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        'http://34.101.122.152/users/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      print(response.data);

      final LoginModel modelSignIn = LoginModel.fromJson(response.data);
      return modelSignIn;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
