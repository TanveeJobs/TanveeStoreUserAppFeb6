import 'package:flutter/material.dart';

class CurvedAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    double height = size.height;
    double width = size.width;
    var path = new Path();
    path.lineTo(0, height - 80);
    path.quadraticBezierTo(width / 2, height + 60, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
