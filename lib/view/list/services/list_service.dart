// ignore_for_file: avoid_dynamic_calls

import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/init/network/dio_manager.dart';
import '../model/list_model.dart';

class LitService {
  Future<List<ChainList>?> getLit() async {
    try {
      final Response response = await DioManager.instance!.dio.get(
        'https://openapi.debank.com/v1/user/total_balance?id=0x5734D110867Db331fce3C5e863dDb6A4F0201ED2',
      );

      if (response.statusCode == 200) {
        final List<ChainList> lit = (response.data['chain_list'] as List)
            .map((e) => ChainList.fromJson(e as Map<String, dynamic>))
            .toList();

        return lit;
      }
    } on DioError catch (e) {
      if (e is SocketException) {
        throw 'İnternet';
      } else {
        throw 'No';
      }
    }
  }
}
