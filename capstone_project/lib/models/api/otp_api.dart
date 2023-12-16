// ignore_for_file: use_build_context_synchronously

import 'package:capstone_project/screens/home_screen/home_screen.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class OtpApi {
  final Dio _dio = Dio();

  Future<bool> createOTP(String email) async {
    try {
      Response response = await _dio.post(
        'https://dev.healthify.my.id/users/get-otp',
        data: {'email': email},
      );
      return response.data['success'] ?? false;
    } catch (error) {
      print('Error creating OTP: $error');
      return false;
    }
  }

  Future<bool> verifyOTP(String email, String otp) async {
    try {
      Response response = await _dio.post(
        'https://dev.healthify.my.id/users/verify-otp',
        data: {'email': email, 'otp': otp},
      );
      return response.data['success'] ?? false;
    } catch (error) {
      print('Error verifying OTP: $error');
      return false;
    }
  }

  Future<void> registerUser(
      BuildContext context, String email, String otp) async {
    print(email);
    try {
      Response response = await _dio.post(
        '${Urls.baseUrl}/users/verify-otp',
        data: {'email': email, 'otp': otp},
      );

      if (response.data['meta']['success'] ?? false) {
        // Registration successful, navigate to the home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        print('Registration failed. Server response: ${response.data}');
      }
    } on DioException catch (error) {
      print(error);
      // print('anjay');
      // print('Error registering user: $error');
    }
  }
}
