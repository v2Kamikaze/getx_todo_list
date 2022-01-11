import 'package:flutter/material.dart';

class HalfEllipseClipper extends CustomClipper<Path> {
  final double heightRatio;
  final double widthRatio;

  const HalfEllipseClipper({
    required this.heightRatio,
    required this.widthRatio,
  });

  @override
  Path getClip(Size size) {
    final double height = size.height;
    final double width = size.width;

    return Path()
      ..lineTo(0.0, height * heightRatio)
      ..quadraticBezierTo(width * widthRatio, height, width * 0.5, height)
      ..quadraticBezierTo(
          width * (1 - widthRatio), height, width, height * heightRatio)
      ..lineTo(width, 0.0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      oldClipper != this;
}
