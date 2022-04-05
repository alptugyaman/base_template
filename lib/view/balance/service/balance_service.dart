import 'package:flutter/foundation.dart';

import '../../../core/init/network/dio_manager.dart';
import '../model/balance_model.dart';

class BalanceService {
  Future<Balance?> getBalance() async {
    const url =
        'https://openapi.debank.com/v1/user/total_balance?id=0x5734D110867Db331fce3C5e863dDb6A4F0201ED2';
    try {
      final response = await DioManager.instance!.dio.get(url);
      if (response.statusCode == 200) {
        final Balance balance =
            Balance.fromJson(response.data as Map<String, dynamic>);

        return balance;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
