import 'package:chella/core/constants/auth_constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: kWhite,
      primaryColor: kPrimaryYellow,
      fontFamily: 'Inter', // Use your preferred font
      
      // Text Theme
      textTheme: const TextTheme(
        // App Name
        displayLarge: TextStyle(
          fontSize: kFontSize4XL,
          fontWeight: FontWeight.bold,
          color: kPrimaryYellow,
          height: 1.2,
        ),
        // "Welcome back to your rewards"
        titleLarge: TextStyle(
          fontSize: kFontSizeL,
          fontWeight: FontWeight.normal,
          color: kGrey600,
          height: 1.4,
        ),
        // "Login to Account"
        headlineMedium: TextStyle(
          fontSize: kFontSize2XL,
          fontWeight: FontWeight.bold,
          color: kPrimaryYellow,
          height: 1.3,
        ),
        // Labels (Username, Password)
        bodyMedium: TextStyle(
          fontSize: kFontSizeM,
          fontWeight: FontWeight.w500,
          color: kGrey700,
          height: 1.4,
        ),
        // Forgot Password & Create Account
        labelMedium: TextStyle(
          fontSize: kFontSizeM,
          fontWeight: FontWeight.w500,
          color: kPrimaryYellow,
          height: 1.4,
        ),
        // Create Account (bold)
        labelLarge: TextStyle(
          fontSize: kFontSizeM,
          fontWeight: FontWeight.w600,
          color: kPrimaryYellow,
          height: 1.4,
        ),
        // "Don't have an account?"
        bodySmall: TextStyle(
          fontSize: kFontSizeM,
          fontWeight: FontWeight.normal,
          color: kGrey600,
          height: 1.4,
        ),
        // Terms & Conditions
        labelSmall: TextStyle(
          fontSize: kFontSizeS,
          fontWeight: FontWeight.normal,
          color: kGrey600,
          height: 1.4,
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryYellow,
          foregroundColor: kBlack,
          minimumSize: const Size(double.infinity, 56.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusM),
          ),
          textStyle: const TextStyle(
            fontSize: kFontSizeL,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
          elevation: 0,
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: kWhite,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: kPaddingL,
          vertical: kPaddingL,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusM),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(
          fontSize: kFontSizeM,
          fontWeight: FontWeight.normal,
          color: kGrey600,
          height: 1.4,
        ),
      ),
    );
  }
}