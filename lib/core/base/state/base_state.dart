import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../init/cache/cache_manager.dart';
import '../../init/navigation/navigation_manager.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  //! Contexts
  ThemeData get themeData => Theme.of(context);
  MediaQueryData get mediaQuery => MediaQuery.of(context);

  double get bottomPadding => mediaQuery.padding.bottom;
  double get topPadding => mediaQuery.padding.top;

  EdgeInsets get flipped => mediaQuery.padding.flipped;
  EdgeInsets get lowHorizontal => EdgeInsets.symmetric(horizontal: 2.5.w);
  EdgeInsets get mediumHorizontal => EdgeInsets.symmetric(horizontal: 5.w);
  EdgeInsets get highHorizontal => EdgeInsets.symmetric(horizontal: 10.w);
  EdgeInsets get lowVertical => EdgeInsets.symmetric(vertical: 2.5.w);
  EdgeInsets get mediumVertical => EdgeInsets.symmetric(vertical: 5.w);
  EdgeInsets get highVertical => EdgeInsets.symmetric(vertical: 10.w);
  EdgeInsets get lowAll => EdgeInsets.all(2.5.w);
  EdgeInsets get mediumAll => EdgeInsets.all(5.w);
  EdgeInsets get highAll => EdgeInsets.all(10.w);

  //? Services
  CacheManager cache = CacheManager.instance;
  NavigationManager navigation = NavigationManager.instance;

  //* Utils
  bool get isKeyboardClose => mediaQuery.viewInsets.bottom > 0 || false;
}
