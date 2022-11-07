import 'package:flutter/material.dart';
import 'package:sandbox/src/paint/paint.dart';
import 'package:sandbox/src/models/page_model.dart';

class PaintPage extends StatefulWidget {
  const PaintPage({Key? key}) : super(key: key);

  static const routeName = '/paint_page';

  static const pageModel = PageModel(
    pageName: 'Canvas',
    pageDescription: 'Paint',
  );

  @override
  State<PaintPage> createState() => _PaintPageState();
}

class _PaintPageState extends State<PaintPage> {
  final List<Line> lines = [];

  Line? newLine;

  Color currentColor = colors.values.first;
  BrushChoice currentBrushType = brushChoices.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(PaintPage.pageModel.pageName),
        elevation: 0,
        actions: [
          PopupMenuButton<BrushChoice>(
            icon: Icon(currentBrushType.iconData),
            onSelected: (newBrushType) {
              setState(() => currentBrushType = newBrushType);
            },
            itemBuilder: (context) => brushChoices
                .map((b) => PopupMenuItem<BrushChoice>(
                      value: b,
                      child: Icon(b.iconData, color: Colors.white),
                    ))
                .toList(),
          ),
          IconButton(
            onPressed: () async => await chooseColor(),
            icon: Icon(Icons.color_lens, color: currentColor),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ...List.generate(
              lines.length,
              (index) => CustomPaint(
                painter: SandboxPainter(
                  color: lines[index].color,
                  points: lines[index].points,
                ),
              ),
            ),
            GestureDetector(
              onPanStart: onPanStart,
              onPanUpdate: onPanUpdate,
              onPanEnd: onPanEnd,
            ),
          ],
        ),
      ),
    );
  }

  void onPanStart(DragStartDetails dragDetails) {
    setState(() {
      newLine = Line(color: currentColor);
      newLine!.points.add(dragDetails.localPosition);
    });
  }

  void onPanUpdate(DragUpdateDetails dragDetails) {
    setState(() {
      newLine?.points.add(dragDetails.localPosition);
    });
  }

  void onPanEnd(DragEndDetails dragDetails) {
    setState(() {
      if (newLine != null) lines.add(newLine!);
      newLine = null;
    });
  }

  Future<void> chooseColor() async {
    var color = await showModalBottomSheet<Color>(
      context: context,
      builder: (context) {
        return ListView(
          children: List.generate(colors.length, (index) {
            final colorName = colors.keys.elementAt(index);
            final color = colors[colorName]!;
            return ListTile(
              leading: CircleAvatar(backgroundColor: color),
              title: Text(colorName),
              onTap: () => Navigator.pop(context, color),
            );
          }),
        );
      },
    );
    if (color != null) setState(() => currentColor = color);
  }

  // Future<void> chooseBrush() async {
  //   var iconData = await showModalBottomSheet<IconData>(
  //     context: context,
  //     builder: (context) {
  //       return ListView(
  //         children: List.generate(brushTypes.length, (index) {
  //           final brushType = brushTypes.keys.elementAt(index);
  //           final brushIcon = brushTypes[brushType]!;
  //           return ListTile(
  //             title: Icon(brushIcon),
  //             onTap: () => Navigator.pop(context, brushIcon),
  //           );
  //         }),
  //       );
  //     },
  //   );
  //   if (iconData != null) setState(() => currentBrushType = iconData);
  // }
}

extension Lines on List<Line> {
  List<Offset> getOffsets() {
    List<Offset> offsets = [];
    this.forEach((line) {
      offsets.addAll(line.points);
    });
    return offsets;
  }
}
