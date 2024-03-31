import 'package:flutter/material.dart';
import 'package:my_task/core/error/exception.dart';
import 'package:my_task/core/secrets/storage_secrets.dart';
import 'package:my_task/core/services/storage_service.dart';
import 'package:my_task/core/themes/presentation/theme/dark_theme.dart';
import 'package:my_task/core/themes/presentation/theme/light_theme.dart';

abstract interface class ThemeLocalDatasource {
  Future<ThemeData> toggleTheme();
  Future<ThemeData> getTheme();
}

class ThemeLocalDatasourceImpl implements ThemeLocalDatasource {
  bool isDarkTheme = true;

  @override
  Future<ThemeData> toggleTheme() async {
    try {
      if (isDarkTheme == true) {
        isDarkTheme = false;
        await StorageService.setBool(key: themeKey, value: isDarkTheme);
        return lightTheme;
      } else if (isDarkTheme == false) {
        isDarkTheme = true;
        await StorageService.setBool(key: themeKey, value: isDarkTheme);
        return darkTheme;
      }
      return lightTheme;
    } on ServerException catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<ThemeData> getTheme() async {
    final bool currentTheme =
        await StorageService.getBool(key: themeKey) ?? false;
    try {
      if (currentTheme == true) {
        return darkTheme;
      } else if (currentTheme == false) {
        return lightTheme;
      }
      return darkTheme;
    } on ServerException catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
