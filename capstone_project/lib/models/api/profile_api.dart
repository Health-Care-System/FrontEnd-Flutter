import 'dart:convert';

import 'package:capstone_project/models/profile_model.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileApi {
  /// GET USER PROFILE
  static Future<ProfileResults?> getUserProfile() async {
    ProfileResults? userData;

    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? token = sharedPref.getString('token');

    try {
      final response = await Dio().get(
        // '${Urls.baseUrl}${Urls.profile}',
        // options: Options(
        //   headers: {
        //     "Authorization": "Bearer $token",
        //   },
        // ),
        'https://dev.healthify.my.id/users/profile',
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFkaXR5YUBnbWFpbC5jb20iLCJleHAiOjE3MDI2NzY4NjIsImlkIjozLCJyb2xlIjoidXNlciJ9.LXDCrrCEvNl2cnUpwh91-XZSHKMyOv7UZ-y9p9lQu1U",
          },
        ),
      );

      final profileModel = profileModelFromJson(jsonEncode(response.data));
      userData = profileModel.results;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        final errorModel = profileModelFromJson(jsonEncode(e.response?.data));
        debugPrint(
            'success: ${errorModel.meta.success}, message: ${errorModel.meta.message}');

        debugPrint(e.response?.statusMessage);
        debugPrint('${e.response?.statusCode}');
      }
    }
    return userData;
  }
}
