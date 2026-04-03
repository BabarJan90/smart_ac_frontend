import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // ── Colour Palette ──────────────────────────────────────────────────────
  static const Color background   = Color(0xFF0A0E1A);  // deep navy
  static const Color surface      = Color(0xFF111827);  // card bg
  static const Color surfaceLight = Color(0xFF1C2537);  // elevated card
  static const Color accent       = Color(0xFF3B82F6);  // electric blue
  static const Color accentGlow   = Color(0x333B82F6);  // blue glow
  static const Color success      = Color(0xFF10B981);  // green
  static const Color warning      = Color(0xFFF59E0B);  // amber
  static const Color danger       = Color(0xFFEF4444);  // red
  static const Color textPrimary  = Color(0xFFF1F5F9);  // near white
  static const Color textSecond   = Color(0xFF94A3B8);  // muted
  static const Color border       = Color(0xFF1E293B);  // subtle border

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    colorScheme: const ColorScheme.dark(
      primary: accent,
      secondary: success,
      surface: surface,
      error: danger,
    ),
    textTheme: GoogleFonts.spaceGroteskTextTheme(
      const TextTheme(
        displayLarge: TextStyle(
          color: textPrimary, fontSize: 32,
          fontWeight: FontWeight.w700, letterSpacing: -0.5,
        ),
        displayMedium: TextStyle(
          color: textPrimary, fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: textPrimary, fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: textPrimary, fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(color: textPrimary, fontSize: 15),
        bodyMedium: TextStyle(color: textSecond, fontSize: 13),
        labelLarge: TextStyle(
          color: accent, fontSize: 13,
          fontWeight: FontWeight.w600, letterSpacing: 0.5,
        ),
      ),
    ),
    // cardTheme: CardTheme(
    //   color: surface,
    //   elevation: 0,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(16),
    //     side: const BorderSide(color: border, width: 1),
    //   ),
    // ),
    appBarTheme: const AppBarTheme(
      backgroundColor: background,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: textPrimary),
      titleTextStyle: TextStyle(
        color: textPrimary, fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    navigationRailTheme: const NavigationRailThemeData(
      backgroundColor: surface,
      selectedIconTheme: IconThemeData(color: accent),
      unselectedIconTheme: IconThemeData(color: textSecond),
      selectedLabelTextStyle: TextStyle(color: accent, fontSize: 12),
      unselectedLabelTextStyle: TextStyle(color: textSecond, fontSize: 12),
      indicatorColor: accentGlow,
    ),
    dividerTheme: const DividerThemeData(color: border, thickness: 1),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: accent,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: surfaceLight,
      labelStyle: const TextStyle(fontSize: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      side: const BorderSide(color: border),
    ),
  );

  // ── Risk Colours ─────────────────────────────────────────────────────────
  static Color riskColor(String? label) {
    switch (label?.toLowerCase()) {
      case 'high':   return danger;
      case 'medium': return warning;
      case 'low':    return success;
      default:       return textSecond;
    }
  }

  static Color riskBg(String? label) {
    switch (label?.toLowerCase()) {
      case 'high':   return danger.withOpacity(0.12);
      case 'medium': return warning.withOpacity(0.12);
      case 'low':    return success.withOpacity(0.12);
      default:       return surfaceLight;
    }
  }
}
