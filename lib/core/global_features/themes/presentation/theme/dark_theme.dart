import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_task/core/global_features/themes/presentation/theme/colors.dart';

final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: redColor).copyWith(
    background: blackColor,
    onBackground: whiteColor,
    secondary: whiteColor,
    onSecondary: blackColor,
  ),
  fontFamily: GoogleFonts.poppins().fontFamily,
);
