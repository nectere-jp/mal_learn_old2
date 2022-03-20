import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';

void showTermModal(BuildContext context) {
  showModalBottomSheet<Container>(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 64),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 70,
                left: 16,
                right: 16,
                bottom: 32,
              ),
              child: FutureBuilder<String>(
                future: rootBundle.loadString('assets/terms.md'),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<String> snapshot,
                ) {
                  return Markdown(data: snapshot.data ?? '');
                },
              ),
            ),
          ),
          Positioned(
            top: 84,
            right: 0,
            child: MaterialButton(
              color: Colors.grey.shade300,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(8),
              elevation: 0,
              child: const Icon(Icons.close, size: 20),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      );
    },
  );
}
