import 'package:flutter/material.dart';
import 'package:shopsmart_user/consts/app_colors.dart';

class Styles {
  static ThemeData themeData(
      {required bool isDarkTheme, required BuildContext context}) {
    return ThemeData(
        scaffoldBackgroundColor: isDarkTheme
            ? AppColors.darkscafoldColor
            : AppColors.lightscafoldColor,
        cardColor: isDarkTheme
            ? Color.fromARGB(255, 13, 6, 37)
            : AppColors.lightCardColor,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        appBarTheme: AppBarTheme(
            backgroundColor: isDarkTheme
                ? AppColors.darkscafoldColor
                : AppColors.lightscafoldColor,
            elevation: 0,
            titleTextStyle:
                TextStyle(color: isDarkTheme ? Colors.white : Colors.black)));
  }
}
