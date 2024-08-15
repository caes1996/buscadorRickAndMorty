// ignore_for_file: constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum AppTheme { LIGHT, DARK }

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
  );

  static final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
  );

  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }

  void setTheme(AppTheme theme) {
    emit(theme == AppTheme.DARK ? _darkTheme : _lightTheme);
  }
}
