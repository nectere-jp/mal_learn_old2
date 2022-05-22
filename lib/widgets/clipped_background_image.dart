import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/providers/user_provider.dart';

class BackgroundImage extends ConsumerWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundImage = ref.watch(backgroundImageProvider).value;

    if (backgroundImage == null) {
      return Container();
    }

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 200,
        child: ClipPath(
          clipper: _BackgroundClipper(),
          child: SizedBox(
            child: Image(
              image: backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class _BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    final path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, h - 45)
      ..quadraticBezierTo(w - 60, h - 10, w / 2, h)
      ..quadraticBezierTo(60, h - 10, 0, h - 45);

    return path;
  }

  @override
  bool shouldReclip(_) => true;
}
