import 'package:flutter/material.dart';

// num screenWidth1 = 0;
// num screenHeight1 = 0;
const num sreenStatusBar = 0;
typedef ResponsiveBuild = Widget Function(
  BuildContext context,
  Orientation orientation,
  DeviceType deviceType,
);

class Sizer extends StatelessWidget {
  const Sizer({
    Key? key,
    required this.builder,
  }) : super(key: key);

  /// Создает виджет при каждом изменении ориентации.
  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    //screenHeight1 = screenWidth;
    print('screenWidth $screenWidth');
    final screenHeight = MediaQuery.of(context).size.height;
    //screenHeight1 = screenHeight;
    print('screenHeight $screenHeight');
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeUtils.setScreenSize(
            constraints, orientation, screenWidth, screenHeight);

        return builder(context, orientation, SizeUtils.deviceType);
      });
    });
  }
}

class SizeUtils {
  static late BoxConstraints boxConstraints;
  static late Orientation orientation;

  /// мобильный телефон или планшет.
  static late DeviceType deviceType;

  static late double height;
  static late double width;

  static void setScreenSize(BoxConstraints constraints,
      Orientation currentOrientation, num screenWidth, num screenHeight) {
    // Sets boxConstraints and orientation
    boxConstraints = constraints;
    orientation = currentOrientation;

    // Sets screen width and height
    if (orientation == Orientation.portrait) {
      width = boxConstraints.maxWidth.isNonZero(defaultValue: screenWidth);
      height = boxConstraints.maxHeight.isNonZero();
    } else {
      width = boxConstraints.maxHeight.isNonZero(defaultValue: screenWidth);
      height = boxConstraints.maxWidth.isNonZero();
    }
    deviceType = DeviceType.mobile;
  }
}

// отступs (для верхней и нижней стороны) и высота экрана
extension ResponsiveExtension on num {
  double get _width => SizeUtils.width;
  double get _height => SizeUtils.height;

  // отступы
  double get h => ((this * _width) / _width); //!375);screenWidth //);

  double get v => (this * _height) / (_height- sreenStatusBar);
  //! - sreenStatusBar); //
  //screenHeigh - sreenStatusBar);

  //минимальный размер картинки в пикс
  double get adaptSize {
    var height = v;
    var width = h;
    return height < width ? height.toDoubleValue() : width.toDoubleValue();
  }

  //размер шрифта в соответсвии с областью просмотра
  double get fSize => adaptSize;
}

extension FormatExtension on double {
  //Вернуть значение [double] с форматированием в соответствии с предоставленной дробной цифрой.
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(toStringAsFixed(fractionDigits));
  }

  double isNonZero({num defaultValue = 0.0}) {
    return this > 0 ? this : defaultValue.toDouble();
  }
}

enum DeviceType { mobile, tablet, desktop }
