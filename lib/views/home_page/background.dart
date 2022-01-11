import 'package:flutter/material.dart';
import 'package:to_do_list/clippers/half_ellipse_clipper.dart';

class Background extends StatelessWidget {
  final double height;
  final double width;
  final double heightRatio;

  const Background({
    Key? key,
    required this.height,
    required this.width,
    this.heightRatio = 0.85,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HalfEllipseClipper(
        heightRatio: heightRatio,
        widthRatio: 0.25,
      ),
      child: Container(
        width: width,
        height: height,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
