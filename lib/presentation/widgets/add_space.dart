import 'package:flutter/material.dart';

class AddSpace {
  static Widget horizontal(double width) {
    return SizedBox(
      width: width,
    );
  }

  static Widget vertical(double height) {
    return SizedBox(
      height: height,
    );
  }
}
