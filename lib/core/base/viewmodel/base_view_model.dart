import 'package:flutter/material.dart';

import '../../init/cache/cache_manager.dart';
import '../../init/navigation/navigation_manager.dart';
import '../../init/network/dio_manager.dart';

abstract class BaseViewModel {
  BuildContext? context;

  void setContext(BuildContext context);
  void init();

  DioManager dio = DioManager.instance!;
  CacheManager cache = CacheManager.instance;
  NavigationManager navigation = NavigationManager.instance;
}
