import 'package:flutter/material.dart';

class AppSizes {
  static late MediaQueryData _mediaQueryData;
  static late double width;
  static late double height;
  static late double defaultSize;
  static late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    width = _mediaQueryData.size.width;
    height = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }

  double screenHeight() => AppSizes.height;
  double screenWidth() => AppSizes.width;
}

double screenHeight() => AppSizes.height;
double screenWidth() => AppSizes.width;

double getHeight(double inputHeight, {double? minHeight, double? maxHeight}) {
  double screenHeight = AppSizes.height;
  var percent = ((screenHeight / 100) * inputHeight) / screenHeight;
  double calculatedHeight = (screenHeight * percent) / 10;

  if (minHeight != null && calculatedHeight < minHeight) {
    return minHeight;
  } else if (maxHeight != null && calculatedHeight > maxHeight) {
    return maxHeight;
  }
  return calculatedHeight;
}

double getWidth(double inputWidth, {double? minWidth, double? maxWidth}) {
  double screenWidth = AppSizes.width;
  double calculatedWidth = (inputWidth / 430) * screenWidth;

  if (minWidth != null && calculatedWidth < minWidth) {
    return minWidth;
  } else if (maxWidth != null && calculatedWidth > maxWidth) {
    return maxWidth;
  }
  return calculatedWidth;
}
