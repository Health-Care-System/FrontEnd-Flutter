import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:capstone_project/utils/utils.dart';

Future<bool> uploadPaymentTransaction({
  required int doctorId,
  required File image,
  required String selectedPaymentMethod,
}) async {
  try {
    await SharedPreferencesUtils.init();
    String token = SharedPreferencesUtils.getToken();
    String fileName = image.path.split('/').last;
    String baseUrl = Urls.baseUrl;

    // Check if the image file exists
    if (!image.existsSync()) {
      throw 'Image file does not exist: ${image.path}';
    }

    Response response = await Dio().post(
      '$baseUrl${Urls.doctortransactions.replaceFirst(':doctor_id', doctorId.toString())}',
      options: Options(
        headers: {
          "authorization": "Bearer $token",
          'Content-Type': 'multipart/form-data',
        },
      ),
      data: FormData.fromMap({
        'payment_method': selectedPaymentMethod.toLowerCase(),
        'payment_confirmation': await MultipartFile.fromFile(
          image.path,
          filename: fileName,
          contentType: MediaType('image', 'jpeg'),
        ),
      }),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      throw 'Failed to upload image. Status Code: ${response.statusCode}';
    }
  // ignore: deprecated_member_use
  } on DioError catch (e) {
    throw '${e.response?.data['message']}';
  }
}
