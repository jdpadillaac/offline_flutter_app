import 'package:flutter/material.dart';

class AppResponsive {
  double? _width, _height;

  AppResponsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Orientation orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait) {
      _width = size.width;
      _height = size.height;
    } else {
      _width = size.height;
      _height = size.width;
    }
  }

  double height(double pixels) {
    double doublePercent = (pixels * 100.0) / 375.0;
    return (_width! * doublePercent) / 100.0;
  }

  double width(double pixels) {
    double doublePercent = (pixels * 100.0) / 812.0;
    return (_height! * doublePercent) / 100.0;
  }
}
