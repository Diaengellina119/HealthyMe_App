import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screen/home_screen.dart';
import '../screen/settings_screen.dart';
import '../screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
        ),
        fontFamily:
            GoogleFonts.leagueSpartan(fontWeight: FontWeight.w400).fontFamily,
        textTheme: GoogleFonts.leagueSpartanTextTheme(
          ThemeData.light().textTheme.apply(
                bodyColor: AppColors.dark,
                displayColor: AppColors.dark,
              ),
        ).copyWith(
          displayLarge: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          displayMedium: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          displaySmall: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          headlineLarge: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          headlineMedium: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          headlineSmall: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          titleLarge: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          titleMedium: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          titleSmall: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          bodyLarge: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          bodyMedium: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          bodySmall: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          labelLarge: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          labelMedium: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          labelSmall: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: AppColors.primary),
          titleTextStyle: GoogleFonts.leagueSpartan(
            color: AppColors.primary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}