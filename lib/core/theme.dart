import 'package:flutter/material.dart';

class AppTheme {
  // 🎨 Colors
  static const Color background = Color(0xFF121212); // أفتح سنة
  static const Color panel = Color(0xFF1C1C1E);
  static const Color accentYellow = Color(0xFFFFD400);
  static const Color accentGreen = Color(0xFF2ECC71);
  static const Color card = Color(0xFF1E1E20);
  static const Color mutedText = Color(0xFF9E9E9E);
  static const Color whiteText = Colors.white;

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    primaryColor: accentGreen,
    fontFamily: "Roboto", // أو غيرها لو عندك font من الفيجما
    colorScheme: ColorScheme.dark(
      primary: accentGreen,
      secondary: accentYellow,
      background: background,
      surface: card,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onSurface: whiteText,
    ),

    // ✅ AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: panel,
      foregroundColor: whiteText,
      elevation: 3,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: whiteText,
      ),
    ),

    // ✅ Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: accentYellow,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
      ),
    ),

    // ✅ Text Button
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: accentYellow,
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),

    // ✅ Inputs
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF1A1A1C),
      hintStyle: const TextStyle(color: Color(0xFFBDBDBD)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF2A2A2A)),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: accentGreen, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    // ✅ Text Theme
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: whiteText, fontSize: 26, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(color: whiteText, fontSize: 20, fontWeight: FontWeight.w600),
      titleLarge: TextStyle(color: whiteText, fontSize: 18, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(color: whiteText, fontSize: 16),
      bodyMedium: TextStyle(color: whiteText, fontSize: 14),
      bodySmall: TextStyle(color: mutedText, fontSize: 12),
      labelLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
    ),
  );
}
