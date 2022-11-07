import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Map<String, Color> colors = {
  'Black': Colors.black,
  'Red': Colors.red,
  'Green': Colors.green,
  'Blue': Colors.blue,
  'Yellow': Colors.yellow,
  'Orange': Colors.orange,
  'Indigo': Colors.indigo,
  'Cyan': Colors.cyan,
  'Brown': Colors.brown,
  'Grey': Colors.grey,
  'Pink': Colors.pink,
  'Purple': Colors.purple,
};

enum BrushType { pencil, dashed, erase }

class BrushChoice {
  final BrushType type;
  final IconData iconData;

  BrushChoice({required this.type, required this.iconData});
}

List<BrushChoice> brushChoices = [
  BrushChoice(type: BrushType.pencil, iconData: FontAwesomeIcons.pencil),
  BrushChoice(type: BrushType.dashed, iconData: FontAwesomeIcons.ellipsis),
  BrushChoice(type: BrushType.erase, iconData: FontAwesomeIcons.eraser),
];
