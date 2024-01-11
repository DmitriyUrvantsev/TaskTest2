import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_theme/theme.dart';


class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillAmberA => BoxDecoration(
        color: PrimaryColors().amberA40033,
      );
  static BoxDecoration get fillAmberA700 => BoxDecoration(
        color: PrimaryColors().amberA700,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: PrimaryColors().gray100,
      );
  static BoxDecoration get fillGray50 => BoxDecoration(
        color: PrimaryColors().gray50,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: basicTheme().colorScheme.primary,
      );
  static BoxDecoration get fillPrimary1 => BoxDecoration(
        color: basicTheme().colorScheme.primary.withOpacity(0.1),
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: PrimaryColors().whiteA700,
      );

  // Outline decorations
  static BoxDecoration get outlineGray => BoxDecoration(
        color: PrimaryColors().whiteA700,
        border: Border.all(
          color: PrimaryColors().gray200,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder47 => BorderRadius.circular(
        47.h,
      );

  // Custom borders
  static BorderRadius get customBorderBL12 => BorderRadius.vertical(
        bottom: Radius.circular(12.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder1 => BorderRadius.circular(
        1.h,
      );
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );
  static BorderRadius get roundedBorder15 => BorderRadius.circular(
        15.h,
      );
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
