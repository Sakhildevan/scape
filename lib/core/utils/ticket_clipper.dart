import 'package:flutter/material.dart';

class TicketClipper extends CustomClipper<Path> {
  double division = 2;
  double radius = 20;

  TicketClipper({this.division = 2, this.radius = 20});
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(Rect.fromCircle(
        center: Offset(0.5, size.height / division), radius: radius));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / division), radius: radius));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class TopCornersTicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addArc(
        Rect.fromCircle(center: const Offset(0.0, 0.0), radius: 30), 270, 180);
    path.addArc(
        Rect.fromCircle(center: Offset(size.width, 0.0), radius: 30), 270, 180);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class BottomCornersTicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addArc(Rect.fromCircle(center: Offset(0.0, size.height), radius: 30),
        360, 270);
    path.addArc(
        Rect.fromCircle(center: Offset(size.width, size.height), radius: 30),
        360,
        270);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class TopBottomTicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Draw main rectangle outline
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    // Add top corner arcs
    path.addArc(
        Rect.fromCircle(center: const Offset(0.0, 0.0), radius: 30), 270, 180);
    path.addArc(
        Rect.fromCircle(center: Offset(size.width, 0.0), radius: 30), 270, 180);

    // Add bottom corner arcs
    path.addArc(Rect.fromCircle(center: Offset(0.0, size.height), radius: 30),
        360, 270);
    path.addArc(
        Rect.fromCircle(center: Offset(size.width, size.height), radius: 30),
        360,
        270);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
