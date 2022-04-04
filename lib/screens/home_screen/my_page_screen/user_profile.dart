import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal_learn/providers/user_provider.dart';

class UserProfile extends ConsumerWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 260,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: const [_BackgroundImage(), _Icon()],
          ),
        ),
        const SizedBox(height: 10),
        const _UserName(),
        const _Id(),
      ],
    );
  }
}

class _Id extends ConsumerWidget {
  const _Id({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.read(userModelProvider).value!.id;

    return Text(
      id ?? '[idが設定されていません]',
      style: TextStyle(
        fontSize: 12,
        color: Colors.teal.shade300,
      ),
    );
  }
}

class _UserName extends ConsumerWidget {
  const _UserName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userName = ref.read(userModelProvider).value!.userName;

    return Text(
      userName ?? '[ユーザー名が指定されていません]',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }
}

class _Icon extends ConsumerWidget {
  const _Icon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final icon = ref.watch(userModelProvider).value!.iconProvider!;

    return Positioned(
      top: 160,
      child: SizedBox(
        width: 100,
        height: 100,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: icon, fit: BoxFit.fill),
            border: Border.all(
              width: 3,
              color: Colors.white,
            ),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 200,
        child: ClipPath(
          clipper: _BackgroundClipper(),
          child: SizedBox(
            child: Image.asset(
              'assets/images/default_background.jpeg',
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
