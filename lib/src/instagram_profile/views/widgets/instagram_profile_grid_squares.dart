import 'dart:math';

import 'package:flutter/material.dart';

class InstagramProfileGridSquares extends StatelessWidget {
  const InstagramProfileGridSquares({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: List.generate(20, (index) {
        return ColoredBox(
          color: Colors.accents[Random().nextInt(Colors.accents.length)],
        );
      }),
    );
  }
}
