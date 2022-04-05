import 'dart:convert';

import 'package:base_template/core/constant/enum/preferences_keys_enum.dart';
import 'package:base_template/core/init/cache/cache_manager.dart';

String getJsonFromJWT(String splittedToken) {
  final normalizedSource = base64Url.normalize(splittedToken);
  return utf8.decode(base64Url.decode(normalizedSource));
}

int? getIdFromToken() {
  var token = CacheManager.instance.getStringValue(PrefsKey.ACCESS_TOKEN);

  token = token!.split('.')[1];

  final Map<String, dynamic> id =
      json.decode(getJsonFromJWT(token)) as Map<String, dynamic>;

  final int? identity = id['identity'] as int?;

  return identity;
}
