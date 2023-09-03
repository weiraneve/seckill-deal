import 'package:flutter/material.dart';

class ArchBackground extends StatelessWidget {
  final double height;

  const ArchBackground({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: const _ArchBackground(
        image: AssetImage("assets/images/bg.jpg"),
      ),
    );
  }
}

class ArchClipper extends CustomClipper<Path> {
  final double factor;

  ArchClipper({this.factor = 0.618});

  @override
  Path getClip(Size size) => Path()
    ..moveTo(0, 0)
    ..relativeLineTo(size.width, 0)
    ..relativeLineTo(0, 0.8 * size.height)
    ..arcToPoint(
      Offset(0.0, size.height * 0.618),
      radius: const Radius.elliptical(50.0, 10.0),
      rotation: 0.0,
    )
    ..close();

  @override
  bool shouldReclip(ArchClipper oldClipper) => factor != oldClipper.factor;
}

class _ArchBackground extends StatelessWidget {
  final ImageProvider image;

  const _ArchBackground({required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ArchClipper(),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
