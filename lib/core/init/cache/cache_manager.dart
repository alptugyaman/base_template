// ignore_for_file: avoid_positional_boolean_parameters

import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/enum/preferences_keys_enum.dart';

class CacheManager {
  static final CacheManager _instance = CacheManager._init();
  static CacheManager get instance => _instance;
  late SharedPreferences _preferences;

  CacheManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  Future<void> prefencesInit() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setStringValue(PrefsKey key, String value) async {
    await _preferences.setString(key.toString(), value);
  }

  String? getStringValue(PrefsKey key) =>
      _preferences.getString(key.toString());

  Future<void> setIntValue(PrefsKey key, int value) async {
    await _preferences.setInt(key.toString(), value);
  }

  int? getIntValue(PrefsKey key) => _preferences.getInt(key.toString());

  Future<void> setBoolValue(PrefsKey key, bool value) async {
    await _preferences.setBool(key.toString(), value);
  }

  bool getBoolValue(PrefsKey key) =>
      _preferences.getBool(key.toString()) ?? false;

  Future<bool> clearAllValues() => _preferences.clear();
}
