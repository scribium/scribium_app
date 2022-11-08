import 'package:flutter/material.dart';

class CurvedClipper extends CustomClipper<Path> {
  final List<double> xValues;
  final List<double> yValues;
  final double strokeWidth;

  CurvedClipper({
    required this.xValues,
    required this.yValues,
    required this.strokeWidth,
  });

  @override
  Path getClip(Size size) {
    var path = Path();
    if (xValues.length > 1 && yValues.isNotEmpty) {
      final maxValue = yValues.last;
      final firstValueHeight = size.height * (xValues.first / maxValue);
      path.moveTo(0.0, size.height - firstValueHeight);

      final itemXDistance = size.width / (xValues.length - 1);
      for (var i = 1; i < xValues.length; i++) {
        final x = itemXDistance * i;
        final valueHeight = size.height -
            strokeWidth -
            ((size.height - strokeWidth) * (xValues[i] / maxValue));
        final previousValueHeight = size.height -
            strokeWidth -
            ((size.height - strokeWidth) * (xValues[i - 1] / maxValue));

        path.quadraticBezierTo(
          x - (itemXDistance / 2) - (itemXDistance / 8),
          previousValueHeight,
          x - (itemXDistance / 2),
          valueHeight + ((previousValueHeight - valueHeight) / 2),
        );
        path.quadraticBezierTo(
          x - (itemXDistance / 2) + (itemXDistance / 8),
          valueHeight,
          x,
          valueHeight,
        );
      }

      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.lineTo(0, 0);
    }

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      oldClipper != this;
}
