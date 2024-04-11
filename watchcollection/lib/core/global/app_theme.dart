import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchcollection/core/global/app_colors.dart';

abstract class AppTheme {
  static ThemeData appTheme() => ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.primaryColor,
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      );
}