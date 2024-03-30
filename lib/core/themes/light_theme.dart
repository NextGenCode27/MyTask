import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_task/core/themes/colors.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    background: whiteColor,
    brightness: Brightness.light,
    error: redColor,
    onBackground: blackColor,
    primary: redColor,
    onPrimary: whiteColor,
    secondary: blackColor,
    onSecondary: whiteColor,
    onError: offWhiteColor,
    surface: redColor,
    onSurface: whiteColor,
    tertiary: greyColor,
    onTertiary: blackColor,
    outline: redColor,
    outlineVariant: greyColor,
    inversePrimary: blackColor,
  ),
  scaffoldBackgroundColor: whiteColor,
  fontFamily: GoogleFonts.poppins().fontFamily,
);
