import 'package:flutter/material.dart';

class AppColors {
  // 🔵 Primary Blue Shades
  static const Color primary = Color(0xFF007AFE);      // iOS blue
  static const Color primaryDark = Color(0xFF0051C7);
  static const Color primaryLight = Color(0xFF66A8FF);

  // 🟠 Secondary Orange-Pink Gradient Style
  static const Color secondary = Color(0xFFFF6B6B);     // Coral Red
  static const Color secondaryLight = Color(0xFFFFA07A);
  static const Color secondaryDark = Color(0xFFD64545);

  // tertiary dark blue 
  
  static const Color tertiary = Color(0xFF0051C7); 
  static const Color tertiaryLight = Color(0xFF66A8FF); // Light blue
  static const Color tertiaryDark = Color.fromARGB(255, 46, 106, 162); // Darker blue

  // 🖤 Text Colors
  static const Color textPrimary = Color(0xFF1C1C1E);   // Dark gray
  static const Color textSecondary = Color(0xFF8E8E93); // iOS system gray

  // 🧊 Backgrounds & Surfaces
  static const Color background = Color(0xFFF9F9F9);    // Off-white
  static const Color card = Color(0xFFFFFFFF);          // Pure white
  static const Color inputField = Color(0xFFF2F2F7);    // Subtle light gray

  // ⚠️ Error
  static const Color error = Color(0xFFFF3B30);         // System red

  // ✅ Success
  static const Color success = Color(0xFF34C759);       // System green

  // 🔍 Other
  static const Color transparent = Colors.transparent;

  // 🌄 Gradient Helpers
  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF007AFE),
      Color(0xFF00C6FF),
    ],
  );

  static const Gradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFF6B6B),
      Color(0xFFFFA07A),
    ],
  );

  static const Gradient tertiaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0051C7),
      Color(0xFF66A8FF),
    ],
  );

  static const Gradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFF9F9F9),
      Color(0xFFECECEC),
    ],
  );
}

