import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserIcon extends ConsumerWidget {
  const UserIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final ImageProvider icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
