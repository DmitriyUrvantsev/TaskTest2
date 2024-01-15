import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_theme/theme.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBluegray200 => basicTheme().textTheme.bodyLarge!.copyWith(
        color: PrimaryColors().blueGray200,
        fontSize: 17.fSize,
      );
  static get bodyLargeOnPrimary => basicTheme().textTheme.bodyLarge!.copyWith(
        color: basicTheme().colorScheme.onPrimary,
      );
      static get bodyLargeOnPrimaryTransparent => basicTheme().textTheme.bodyLarge!.copyWith(
        color: basicTheme().colorScheme.onPrimary.withOpacity(0.5),
      );
  static get bodyLargeSecondaryContainer =>
      basicTheme().textTheme.bodyLarge!.copyWith(
            color: basicTheme().colorScheme.secondaryContainer.withOpacity(1),
          );
  static get bodyLargeSecondaryContainer_1 =>
      basicTheme().textTheme.bodyLarge!.copyWith(
            color: basicTheme().colorScheme.secondaryContainer,
          );
  // Title text style
  static get titleMediumAmberA700 =>
      basicTheme().textTheme.titleMedium!.copyWith(
            color: PrimaryColors().amberA700,
          );
  static get titleMediumOnSecondaryContainer =>
      basicTheme().textTheme.titleMedium!.copyWith(
            color: basicTheme().colorScheme.onSecondaryContainer,
          );
  static get titleMediumPrimary => basicTheme().textTheme.titleMedium!.copyWith(
        color: basicTheme().colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumPrimary_1 =>
      basicTheme().textTheme.titleMedium!.copyWith(
            color: basicTheme().colorScheme.primary,
          );
  static get titleMediumSecondaryContainer =>
      basicTheme().textTheme.titleMedium!.copyWith(
            color: basicTheme().colorScheme.secondaryContainer.withOpacity(1),
            fontSize: 18.fSize,
          );
  static get titleMediumWhiteA700 =>
      basicTheme().textTheme.titleMedium!.copyWith(
            color: PrimaryColors().whiteA700,
          );
  static get titleSmallPrimary => basicTheme().textTheme.titleSmall!.copyWith(
        color: basicTheme().colorScheme.primary,
      );
  static get titleSmallPrimary17 => basicTheme()
      .textTheme
      .titleSmall!
      .copyWith(color: basicTheme().colorScheme.primary, fontSize: 17);
}

// extension on TextStyle {
//   TextStyle get sFProDisplay {
//     return copyWith(
//       fontFamily: 'SF Pro Display', //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//     );
//   }
// }
