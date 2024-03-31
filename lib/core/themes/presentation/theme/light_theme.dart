import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_task/core/themes/presentation/theme/colors.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: redColor).copyWith(
    background: whiteColor,
    secondary: blackColor,
  ),
  fontFamily: GoogleFonts.poppins().fontFamily,
);
