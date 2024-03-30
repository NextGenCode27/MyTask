import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_task/core/themes/colors.dart';

final ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme(
    background: blackColor,
    brightness: Brightness.dark,
    error: redColor,
    onBackground: offWhiteColor,
    primary: redColor,
    onPrimary: blackColor,
    secondary: whiteColor,
    onSecondary: blackColor,
    onError: offWhiteColor,
    surface: redColor,
    onSurface: whiteColor,
    tertiary: greyColor,
    onTertiary: blackColor,
    outline: redColor,
    outlineVariant: greyColor,
    inversePrimary: blackColor,
    shadow: redColor,
  ),
  scaffoldBackgroundColor: blackColor,
  fontFamily: GoogleFonts.poppins().fontFamily,
);
