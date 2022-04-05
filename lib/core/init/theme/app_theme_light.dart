import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppThemeLight extends AppTheme {
  AppThemeLight.light();

  MaterialColor get _primary => Colors.red;

  @override
  ThemeData get theme => ThemeData(
        brightness: Brightness.light,
        primarySwatch: _primary, ////ButtonColors
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        appBarTheme: const AppBarTheme(elevation: 1, centerTitle: true),
        checkboxTheme: const CheckboxThemeData().copyWith(
          side: BorderSide(color: _primary, width: 2),
          shape: const CircleBorder(),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontSize: 16,
            backgroundColor: Colors.amber,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),

          //TEXT
          bodyText2: TextStyle(
            color: Colors.white,
          ),

          //BUTTON
          button: TextStyle(
            color: Colors.white,
          ),

          //ListTile title
          subtitle1: TextStyle(
            color: Colors.red,
            fontSize: 18,
          ),
        ),

        inputDecorationTheme: _inputDecorationTheme(),
        elevatedButtonTheme: _elevatedButtonTheme(),
        outlinedButtonTheme: _outlinedButtonTheme(),
      );

  ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  OutlinedButtonThemeData _outlinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  InputDecorationTheme _inputDecorationTheme() {
    return const InputDecorationTheme().copyWith(
      errorMaxLines: 3,
      labelStyle: TextStyle(color: Colors.grey.shade200),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.grey.shade600),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.grey.shade600),
      ),
    );
  }
}
