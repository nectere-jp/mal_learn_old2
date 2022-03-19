import 'package:flutter/material.dart';

class IconPicker extends StatelessWidget {
  const IconPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                side: const BorderSide(
                  color: Colors.grey,
                ),
                padding: EdgeInsets.zero,
              ),
              onPressed: () {},
              child: const ClipOval(
                child: Image(
                  width: 95,
                  height: 95,
                  image: AssetImage('assets/images/default_icon.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              child: const Icon(Icons.add, color: Colors.white),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepOrange,
                border: Border.all(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
