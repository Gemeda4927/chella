// lib/core/theme/app_theme.dart
import 'package:flutter/material.dart';
import 'package:chella/core/constants/auth_constants.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: kWhite,
      primaryColor: kPrimaryYellow,
      fontFamily: 'Inter',
      brightness: Brightness.light,
      
      // Clean Text Theme
      textTheme: TextTheme(
        // App Name
        displayLarge: const TextStyle(
          fontSize: kFontSize3XL,
          fontWeight: FontWeight.w800,
          color: kPrimaryYellow,
          height: 1.2,
        ),
        
        // Page Titles
        headlineMedium: const TextStyle(
          fontSize: kFontSize2XL,
          fontWeight: FontWeight.w700,
          color: kGrey800,
          height: 1.3,
        ),
        
        // Subtitles
        titleLarge: const TextStyle(
          fontSize: kFontSizeL,
          fontWeight: FontWeight.w400,
          color: kGrey600,
          height: 1.4,
        ),
        
        // Form Labels
        bodyMedium: const TextStyle(
          fontSize: kFontSizeM,
          fontWeight: FontWeight.w500,
          color: kGrey700,
          height: 1.4,
        ),
        
        // Links & Buttons
        labelMedium: const TextStyle(
          fontSize: kFontSizeM,
          fontWeight: FontWeight.w500,
          color: kPrimaryYellow,
          height: 1.4,
        ),
        
        // Bold Links
        labelLarge: const TextStyle(
          fontSize: kFontSizeM,
          fontWeight: FontWeight.w600,
          color: kPrimaryYellow,
          height: 1.4,
        ),
        
        // Small Text
        bodySmall: const TextStyle(
          fontSize: kFontSizeS,
          fontWeight: FontWeight.w400,
          color: kGrey600,
          height: 1.4,
        ),
        
        // Very Small Text
        labelSmall: const TextStyle(
          fontSize: kFontSizeXS,
          fontWeight: FontWeight.w400,
          color: kGrey600,
          height: 1.4,
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryYellow,
          foregroundColor: kBlack,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusM),
          ),
          textStyle: const TextStyle(
            fontSize: kFontSizeL,
            fontWeight: FontWeight.w600,
          ),
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: kPaddingL),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: kGrey50,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: kPaddingL,
          vertical: kPaddingM,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusM),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusM),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusM),
          borderSide: const BorderSide(color: kPrimaryYellow, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusM),
          borderSide: const BorderSide(color: kError, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusM),
          borderSide: const BorderSide(color: kError, width: 1.5),
        ),
        hintStyle: const TextStyle(
          fontSize: kFontSizeM,
          fontWeight: FontWeight.w400,
          color: kGrey600,
        ),
        errorStyle: const TextStyle(
          fontSize: kFontSizeS,
          fontWeight: FontWeight.w400,
          color: kError,
        ),
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: kGrey300,
        thickness: 1,
        space: 0,
      ),
    );
  }
}