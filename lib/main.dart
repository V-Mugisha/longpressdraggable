import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: DragBoxScreen()));

class DragBoxScreen extends StatefulWidget {
  const DragBoxScreen({super.key});

  @override
  State<DragBoxScreen> createState() => _DragBoxScreenState();
}

class _DragBoxScreenState extends State<DragBoxScreen> {
  double x = 100;
  double y = 200;

  Widget buildBox() {
    return Container(
      width: 150,
      height: 150,
      color: Colors.blue,
      alignment: Alignment.center,
      child: const Text('Drag Me', style: TextStyle(color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drag Box"),),
      body: Stack(
        children: [
          Positioned(
            left: x,
            top: y,
            child: LongPressDraggable<String>(
              data: 'box',
              feedback: Container(
                width: 150,
                height: 150,
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text(
                  'Dragging...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              childWhenDragging: Opacity(opacity: 0.3, child: buildBox()),
              onDragEnd: (details) {
                setState(() {
                  x = details.offset.dx;
                  y = details.offset.dy;
                });
              },
              child: buildBox(),
            ),
          ),
        ],
      ),
    );
  }
}
