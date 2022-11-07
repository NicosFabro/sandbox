import 'dart:math';

import 'package:flutter/material.dart';

class InstagramProfileGridRectangles extends StatelessWidget {
  const InstagramProfileGridRectangles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 48) / 2;
    final double itemWidth = size.width / 2;

    final length = Random().nextInt(20);

    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      padding: EdgeInsets.zero,
      childAspectRatio: itemWidth / itemHeight,
      children: List.generate(length, (index) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          color: Colors.accents[Random().nextInt(Colors.accents.length)],
        );
      }),
    );
  }
}
