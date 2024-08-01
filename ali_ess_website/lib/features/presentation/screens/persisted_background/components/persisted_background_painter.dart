import 'package:flutter/material.dart';

import '../../../../../core/resources/persisted_background_star.dart';
import '../../../../../core/util/app_util.dart';

class PersistedBackgroundPainter extends CustomPainter {
  final List<PersistedBackgroundStar> stars;
  final double starLength;

  PersistedBackgroundPainter(this.stars, {this.starLength = 0});

  @override
  void paint(Canvas canvas, Size size) {
    //Translates (moves) the canvas origin to the center of the canvas.
    canvas.translate(size.width / 2, size.height / 2);
    Paint paint = Paint()..strokeCap = StrokeCap.round; // Use rounded line caps
    for (PersistedBackgroundStar star in stars) {
      paint.color = star.color;
      paint.strokeWidth = AppUtil.remap(star.z, 0, 500, star.size, 0);
      double sx = AppUtil.remap(star.x / star.z, 0, 1, 0, size.width);
      double sy = AppUtil.remap(star.y / star.z, 0, 1, 0, size.height);

      Offset p1 = Offset(sx, sy);
      Offset p2 = Offset(sx + calculateLength(sx, size.width, starLength),
          sy + calculateLength(sy, size.height, starLength));
      canvas.drawLine(p1, p2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

double calculateLength(double axis, double size, double givenLength) {
  // Ensure that x is within the valid range [-fullWidth/2, fullWidth/2]
  axis = axis.clamp(-size / 2, size / 2);
  double length =
      AppUtil.remap(axis, -size / 2, size / 2, -givenLength, givenLength);
  return length;
}
