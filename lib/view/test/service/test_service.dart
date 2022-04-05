import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/init/network/dio_manager.dart';
import '../model/test_model.dart';

class TestService {
  // TestService();

  Future<Test?> getTest() async {
    try {
      final Response response = await DioManager.instance!.dio.get(
        // UrlConstant.ACTIVITY,
        'https://mocki.io/v1/d5e90046-e109-49d2-867a-03bf4b25b1b6',
      );

      if (response.statusCode == 200) {
        final Test text = testFromJson(response.data);

        return text;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        throw 'NOOO';
      } else if (e is SocketException) {
        throw 'İnternet';
      } else {
        throw 'Sunucu';
      }
    }
  }
}
