import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LunaColors {
  static const Color darkPurple = Color(0xFF2B2447);
  static const Color mediumPurple = Color(0xFF6B5FA6);
  static const Color lightPurple = Color(0xFFB9A7D9);
  static const Color gold = Color(0xFFD8B67A);
  static const Color cream = Color(0xFFF7EAD6);

  // Semantic aliases
  static const Color primary = darkPurple;
  static const Color primaryVariant = mediumPurple;
  static const Color secondary = lightPurple;
  static const Color accent = gold;
  static const Color surface = cream;
  static const Color background = Color(0xFFFAF8F5);
  static const Color textPrimary = darkPurple;
  static const Color textSecondary = Color(0xFF6E6A7C);
  static const Color white = Colors.white;
  static const Color grey = Color(0xFF9E9E9E);
  static const Color lightGrey = Color(0xFFF0EEF2);
}

class LunaTheme {
  static ThemeData get theme {
    final textTheme = GoogleFonts.interTextTheme();

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: LunaColors.primary,
        primary: LunaColors.primary,
        secondary: LunaColors.mediumPurple,
        tertiary: LunaColors.gold,
        surface: LunaColors.white,
        background: LunaColors.background,
        onPrimary: LunaColors.white,
        onSecondary: LunaColors.white,
        onSurface: LunaColors.textPrimary,
        onBackground: LunaColors.textPrimary,
      ),
      scaffoldBackgroundColor: LunaColors.background,
      textTheme: textTheme.copyWith(
        displayLarge: GoogleFonts.dmSerifDisplay(
          fontSize: 32,
          color: LunaColors.textPrimary,
        ),
        displayMedium: GoogleFonts.dmSerifDisplay(
          fontSize: 28,
          color: LunaColors.textPrimary,
        ),
        displaySmall: GoogleFonts.dmSerifDisplay(
          fontSize: 24,
          color: LunaColors.textPrimary,
        ),
        headlineLarge: GoogleFonts.dmSerifDisplay(
          fontSize: 22,
          color: LunaColors.textPrimary,
        ),
        headlineMedium: GoogleFonts.dmSerifDisplay(
          fontSize: 20,
          color: LunaColors.textPrimary,
        ),
        headlineSmall: GoogleFonts.dmSerifDisplay(
          fontSize: 18,
          color: LunaColors.textPrimary,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: LunaColors.textPrimary,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: LunaColors.textPrimary,
        ),
        titleSmall: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: LunaColors.textPrimary,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          color: LunaColors.textPrimary,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          color: LunaColors.textSecondary,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 12,
          color: LunaColors.textSecondary,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: LunaColors.white,
        ),
        labelMedium: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: LunaColors.white,
        foregroundColor: LunaColors.textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.dmSerifDisplay(
          fontSize: 20,
          color: LunaColors.textPrimary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: LunaColors.primary,
          foregroundColor: LunaColors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: LunaColors.primary,
          side: const BorderSide(color: LunaColors.primary),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: LunaColors.lightGrey,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(color: LunaColors.mediumPurple, width: 2),
        ),
        hintStyle: GoogleFonts.inter(
          fontSize: 14,
          color: LunaColors.grey,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: LunaColors.lightGrey,
        selectedColor: LunaColors.primary,
        labelStyle: GoogleFonts.inter(
          fontSize: 13,
          color: LunaColors.textPrimary,
        ),
        secondaryLabelStyle: GoogleFonts.inter(
          fontSize: 13,
          color: LunaColors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        side: BorderSide.none,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: LunaColors.white,
        selectedItemColor: LunaColors.primary,
        unselectedItemColor: LunaColors.grey,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedLabelStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontSize: 11),
      ),
    );
  }
}
