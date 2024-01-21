// import 'package:flutter/material.dart';

// // num screenWidth1 = 0;
// // num screenHeight1 = 0;
// const num sreenStatusBar = 0;
// typedef ResponsiveBuild = Widget Function(
//   BuildContext context,
//   Orientation orientation,
//   DeviceType deviceType,
// );

// class Sizer extends StatelessWidget {
//   const Sizer({
//     Key? key,
//     required this.builder,
//   }) : super(key: key);

//   /// Создает виджет при каждом изменении ориентации.
//   final ResponsiveBuild builder;

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     //screenHeight1 = screenWidth;
//     print('screenWidth $screenWidth');
//     final screenHeight = MediaQuery.of(context).size.height;
//     //screenHeight1 = screenHeight;
//     print('screenHeight $screenHeight');
//     return LayoutBuilder(builder: (context, constraints) {
//       return OrientationBuilder(builder: (context, orientation) {
//         SizeUtils.setScreenSize(
//             constraints, orientation, screenWidth, screenHeight);

//         return builder(context, orientation, SizeUtils.deviceType);
//       });
//     });
//   }
// }

// class SizeUtils {
//   static late BoxConstraints boxConstraints;
//   static late Orientation orientation;

//   /// мобильный телефон или планшет.
//   static late DeviceType deviceType;

//   static late double height;
//   static late double width;

//   static void setScreenSize(BoxConstraints constraints,
//       Orientation currentOrientation, num screenWidth, num screenHeight) {
//     // Sets boxConstraints and orientation
//     boxConstraints = constraints;
//     orientation = currentOrientation;

//     // Sets screen width and height
//     if (orientation == Orientation.portrait) {
//       width = boxConstraints.maxWidth.isNonZero(defaultValue: screenWidth);
//       height = boxConstraints.maxHeight.isNonZero();
//     } else {
//       width = boxConstraints.maxHeight.isNonZero(defaultValue: screenWidth);
//       height = boxConstraints.maxWidth.isNonZero();
//     }
//     deviceType = DeviceType.mobile;
//   }
// }

// // отступs (для верхней и нижней стороны) и высота экрана
// extension ResponsiveExtension on num {
//   double get _width => SizeUtils.width;
//   double get _height => SizeUtils.height;

//   // отступы
//   double get h => ((this * _width) / _width); //!375);screenWidth //);

//   double get v => (this * _height) / (_height- sreenStatusBar);
//   //! - sreenStatusBar); //
//   //screenHeigh - sreenStatusBar);

//   //минимальный размер картинки в пикс
//   double get adaptSize {
//     var height = v;
//     var width = h;
//     return height < width ? height.toDoubleValue() : width.toDoubleValue();
//   }

//   //размер шрифта в соответсвии с областью просмотра
//   double get fSize => adaptSize;
// }

// extension FormatExtension on double {
//   //Вернуть значение [double] с форматированием в соответствии с предоставленной дробной цифрой.
//   double toDoubleValue({int fractionDigits = 2}) {
//     return double.parse(toStringAsFixed(fractionDigits));
//   }

//   double isNonZero({num defaultValue = 0.0}) {
//     return this > 0 ? this : defaultValue.toDouble();
//   }
// }

// enum DeviceType { mobile, tablet, desktop }

//!=============================================================================
//!============================Widget=================================================

import 'package:flutter/material.dart';
import 'dart:math' as math;
//import 'package:hottel_1/main_sizer/flutter_sizer.dart';

typedef ResponsiveBuild = Widget Function(
  BuildContext,
  Orientation,
  ScreenType,
);

/// A widget that gets the device's details like orientation and constraints
///
/// Usage: Wrap MaterialApp with this widget
class Sizer extends StatelessWidget {
  const Sizer({Key? key, required this.builder}) : super(key: key);

  /// Builds the widget whenever the orientation changes
  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        print(orientation);
        Device.setScreenSize(constraints, orientation);
        return builder(context, orientation, Device.screenType);
        
      });
    });
  }
}

//!=======================Helper======================================================
/// Type of Screen
///
/// This can be either mobile or tablet
enum ScreenType { mobile, tablet }

class Device {
  /// Device's BoxConstraints
  static late BoxConstraints boxConstraints;

  /// Device's Orientation
  static late Orientation orientation;

  /// Type of Device
  ///
  /// This can either be mobile or tablet
  static late ScreenType screenType;

  /// Device's Height
  static late double height;

  /// Device's Width
  static late double width;

  /// Devices' devicePixelRatio
  static double get devicePixelRatio {
    // Usually 2.0
    return WidgetsBinding.instance.window.devicePixelRatio;
  }

  /// Device's Pixel density https://material.io/design/layout/pixel-density.html#pixel-density
  static double get pixelDensity {
    var density =
        devicePixelRatio * (width > height ? width / height : height / width);
    print('density - $density');
    return density;
  }

  /// Sets the Screen's size and Device's Orientation,
  /// BoxConstraints, Height, and Width
  static void setScreenSize(
      BoxConstraints constraints, Orientation currentOrientation) {
    // Sets boxconstraints and orientation
    boxConstraints = constraints;
    orientation = currentOrientation;
print(orientation);
    // Sets screen width and height
    width = boxConstraints.maxWidth;
    height = boxConstraints.maxHeight;

    // Sets ScreenType
    if ((orientation == Orientation.portrait && width < 600) ||
        (orientation == Orientation.landscape && height < 600)) {
      screenType = ScreenType.mobile;
    } else {
      screenType = ScreenType.tablet;
    }
  }
}

class Adaptive {
  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  static double h(num height) => height.h;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's width
  static double v(num width) => width.v;

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  static double sp(num scalablePixel) => scalablePixel.sp;

  /// Calculates the dp (Density pixels) depending on the device's screen size
  static double dp(num scalablePixel) => scalablePixel.dp;
}

//!==========================Extention===================================================
extension DeviceExt on num {
  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  double get h => this * Device.height / 812;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's width
  double get v => this * Device.width / 375;

  /// Calculates the dp (Density pixels) depending on the device's screen size
  double get dp =>
      (math.log(Device.width * Device.height * Device.devicePixelRatio) /
              math.log(2) /
              18 *
              this)
          .abs();

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  @deprecated
  double get sp => this.dp;
}
