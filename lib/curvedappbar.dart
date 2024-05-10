import 'dart:ui';

import 'package:flutter/material.dart';

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(0, size.height + 10, size.width * 0.2, size.height);
    path.lineTo(size.width * 0.8, size.height);
    var controlPoint = Offset(size.width / 2, size.height + 50);
    var endPoint = Offset(size.width * 0.8, size.height);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.quadraticBezierTo(
        size.width, size.height + 10, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
