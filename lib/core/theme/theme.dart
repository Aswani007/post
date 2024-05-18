import 'package:flutter/material.dart';

import 'app_palette.dart';

class AppTheme {

  static _border([Color color = AppPalette.borderColor]) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: color,
      width: 3,
    ),
  );

  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPalette.whiteColor,
    appBarTheme:
        const AppBarTheme(backgroundColor: AppPalette.transparentColor),
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(21),
        border: _border(),
        enabledBorder: _border(),
        focusedBorder: _border(AppPalette.black),
        errorBorder: _border(AppPalette.errorBorder)),
    cardTheme: const CardTheme(
      color: AppPalette.whiteColor,
      surfaceTintColor: AppPalette.whiteColor,
    ),

  );
}
