import 'package:flutter/material.dart';

import 'package:hottel_1/x_core/x_utils/size_utils.dart';



  ThemeData basicTheme() => ThemeData(
    visualDensity: VisualDensity.standard,
     colorScheme: ColorSchemes.primaryColorScheme,
    
    textTheme: TextThemes.textTheme(ColorSchemes.primaryColorScheme),
    scaffoldBackgroundColor:  PrimaryColors().gray100,//!
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor:  ColorSchemes.primaryColorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.h),
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        padding: EdgeInsets.zero,
      ),
    ),
    dividerTheme: DividerThemeData(thickness: 1, space: 1, color: Colors.amber
        //!colorScheme.onPrimaryContainer,
        ),
  );



/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF0D72FF),
    secondaryContainer: Color(0XE5000000),

    // On colors(text colors)
    onPrimary: Color(0XFF14132A),
    onPrimaryContainer: Color(0X26828796),
    onSecondaryContainer: Color(0XFF2C3035),
  );
}

// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 16.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 14.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: colorScheme.secondaryContainer.withOpacity(1),
          fontSize: 30.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: colorScheme.secondaryContainer.withOpacity(1),
          fontSize: 22.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 16.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: PrimaryColors().blueGray400,
          fontSize: 14.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Amber
  Color  amberA40033 = const Color(0X33FFC600);
  Color  amberA700 = const Color(0XFFFFA800);

  // BlueGray
  Color  blueGray200 = const Color(0XFFA8ABB6);
  Color  blueGray400 = const Color(0XFF828696);

  // Gray
  Color  gray100 = const Color(0XFFF6F6F9);
  Color  gray200 = const Color(0XFFE8E9EC);
  Color  gray50 = const Color(0XFFFBFBFC);

  // White
  Color  whiteA700 = const Color(0XFFFFFFFF);
}
