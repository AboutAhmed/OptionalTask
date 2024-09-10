import 'package:flutter/material.dart';
import 'draggable_widget.dart';
import 'drop_zone.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Draggable Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Draggable Widget Demo')),
        body: Stack(
          children: [
            Positioned(
              left: 100,
              top: 100,
              child: DropZone(
                child: Text(
                  'Drop Here',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            DraggableItem(
              key: UniqueKey(),
              initialPosition: Offset(50, 50),
              child: Container(
                color: Colors.red,
                width: 100,
                height: 100,
                child: Center(child: Text('Drag me')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
