import 'dart:math';
import 'package:flutter/material.dart';

class Screen {
  static bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;
  static Size size(BuildContext context) => MediaQuery.of(context).size;
  static double width(BuildContext context) => size(context).width;
  static double height(BuildContext context) => size(context).height;
  static double diagonal(BuildContext context) {
    Size s = size(context);
    return sqrt((s.width * s.width) + (s.height * s.height));
  }

  //INCHES
  static Size inches(BuildContext c) {
    Size pxSize = size(c);
    return Size(pxSize.width / 96, pxSize.width / 96);
  }

  static double widthInches(BuildContext c) => inches(c).width;
  static double heightInches(BuildContext c) => inches(c).height;
  static double diagonalInches(BuildContext c) => diagonal(c) / 96;
}
