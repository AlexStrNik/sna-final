import 'dart:math';

import 'package:flutter/material.dart';

class BackgroundClipper extends CustomClipper<Path> {
  double radius = 14;

  @override
  Path getClip(Size size) {
    Path path1 = Path()
      ..lineTo(size.width - radius, 0)
      ..arcTo(
          Rect.fromPoints(Offset(size.width - radius, 0),
              Offset(size.width, radius)), // Rect
          1.5 * pi, // Start engle
          0.5 * pi, // Sweep engle
          true) // direction clockwise
      ..lineTo(size.width, size.height - radius)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(size.width - radius, size.height - radius),
              radius: radius),
          0,
          0.5 * pi,
          false)
      ..lineTo(size.width * 0.35, size.height)
      ..lineTo(0, 0)
      ..close();

    return path1;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
