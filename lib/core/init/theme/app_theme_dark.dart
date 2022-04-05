import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppThemeDark extends AppTheme {
  AppThemeDark.dark();

  MaterialColor get _primary => Colors.grey;

  @override
  ThemeData get theme => ThemeData(
        // fontFamily: AppConstant.FONT_FAMILY,
        brightness: Brightness.dark,
        primarySwatch: _primary, ////ButtonColors
      );
}
