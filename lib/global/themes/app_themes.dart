import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static ThemeData light() {
    return getThemeData(
      Brightness.light,
      const ColorScheme.light(
        primary: AppColors.primary600,
        secondary: AppColors.secondary600,
        background: AppColors.backgroundLight,
        onBackground: AppColors.backgroundLight,
      ),
    );
  }

  static ThemeData dark() {
    return getThemeData(
      Brightness.dark,
      const ColorScheme.dark(
        primary: AppColors.primary600,
        secondary: AppColors.secondary600,
        background: AppColors.backgroundDark,
        onBackground: AppColors.backgroundDark,
      ),
    );
  }

  static ThemeData getThemeData(
    Brightness brightness,
    ColorScheme colorScheme,
  ) {
    bool isDark = colorScheme.brightness == Brightness.dark;
    final primaryText = isDark ? AppColors.white : AppColors.greyG100;
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Gespage',
      brightness: brightness,
      primaryColor: colorScheme.primary,
      unselectedWidgetColor: AppColors.greyG200,
      scaffoldBackgroundColor: colorScheme.background,
      indicatorColor: colorScheme.primary,
      appBarTheme: AppBarTheme(
        color: colorScheme.background,
        foregroundColor: AppColors.greyG200,
        surfaceTintColor: colorScheme.background,
        iconTheme: IconThemeData(
          color: colorScheme.secondary,
        ),
        elevation: 0.3,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 16,
          color: colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.greyG400,
        thickness: 1,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          minimumSize: const Size(48, 48),
          backgroundColor: isDark ? AppColors.primary500 : AppColors.primary600,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          foregroundColor: AppColors.white,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(
            color: colorScheme.primary,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(48, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: BorderSide(
            color: isDark ? AppColors.primary400 : AppColors.primary600,
            width: 1.5,
          ),
          foregroundColor: AppColors.primary600,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.primary600,
            fontSize: 16,
          ),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          height: 2,
          color: primaryText,
        ),
        displayMedium: TextStyle(
          fontSize: 24,
          height: 1.3,
          fontWeight: FontWeight.w600,
          color: primaryText,
        ),
        displaySmall: TextStyle(
          fontSize: 20,
          height: 1.4,
          fontWeight: FontWeight.w600,
          color: primaryText,
        ),
        headlineLarge: TextStyle(
          fontSize: 18,
          height: 1.4,
          fontWeight: FontWeight.w600,
          color: primaryText,
        ),
        headlineMedium: TextStyle(
          fontSize: 16,
          height: 1.5,
          fontWeight: FontWeight.w600,
          color: primaryText,
        ),
        headlineSmall: TextStyle(
          fontSize: 14,
          height: 1.6,
          fontWeight: FontWeight.w600,
          color: primaryText,
        ),
        bodyLarge: TextStyle(
          height: 1.5,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: primaryText,
        ),
        bodyMedium: TextStyle(
          height: 1.6,
          fontSize: 14,
          color: primaryText,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          height: 1.7,
          fontSize: 12,
          color: primaryText,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: primaryText,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 1.1,
        ),
        labelMedium: TextStyle(
          color: primaryText,
          fontWeight: FontWeight.w500,
          fontSize: 12,
          height: 1.7,
        ),
        labelSmall: TextStyle(
          color: primaryText,
          fontWeight: FontWeight.w400,
          fontSize: 10,
          height: 1.8,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        filled: true,
        fillColor: isDark ? AppColors.blackG50 : Colors.transparent,
        constraints: const BoxConstraints(minHeight: 48),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 13,
        ),
        hintStyle: const TextStyle(
          fontSize: 14,
          color: AppColors.greyG300,
          fontWeight: FontWeight.w400,
          height: 1.6,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.greyG400),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: isDark ? Colors.transparent : AppColors.greyG400),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.greyG400),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
      ),
      tabBarTheme: const TabBarTheme(
        unselectedLabelColor: AppColors.greyG400,
        labelColor: AppColors.greyG100,
        labelStyle: TextStyle(fontWeight: FontWeight.w700),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
      ),
      colorScheme: colorScheme.copyWith(background: colorScheme.background),
      cardTheme: CardTheme(
        surfaceTintColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
