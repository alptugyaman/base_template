import 'package:base_template/view/last/model/last_model.dart';
import 'package:flutter/foundation.dart';

import '../../../core/init/network/dio_manager.dart';

class LastBalance {
  Future<Nutritions?> getLast() async {
    const url = 'https://mocki.io/v1/62fd6c37-e300-43f4-af1d-2405c7f6d5b6';
    try {
      final response = await DioManager.instance!.dio.get(url);
      if (response.statusCode == 200) {
        final List<Nutritions> nutritions = (response.data as List)
            .map((e) => Nutritions.fromJson(e as Map<String, dynamic>))
            .toList();

        return nutritions.first;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
