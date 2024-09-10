import 'package:flutter/material.dart';

class DraggableItem extends StatefulWidget {
  final Key key;
  final Offset initialPosition;
  final Widget child;

  const DraggableItem({
    required this.key,
    required this.initialPosition,
    required this.child,
  }) : super(key: key);

  @override
  _DraggableItemState createState() => _DraggableItemState();
}

class _DraggableItemState extends State<DraggableItem> {
  late Offset position;
  bool isSnapped = false;

  @override
  void initState() {
    super.initState();
    position = widget.initialPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable(
        feedback: Material(
          color: Colors.transparent,
          child: widget.child,
        ),
        child: widget.child,
        childWhenDragging: Container(),
        onDragEnd: (details) {
          final renderBox = context.findRenderObject() as RenderBox?;
          final offset = renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;

          // Check if the dragged item is inside the drop zone
          if (details.offset.dx >= 100 &&
              details.offset.dx <= 300 &&
              details.offset.dy >= 100 &&
              details.offset.dy <= 300) {
            setState(() {
              isSnapped = true;
              position = details.offset;
            });
          } else {
            // Return to original position
            setState(() {
              isSnapped = false;
              position = widget.initialPosition;
            });
          }
        },
      ),
    );
  }
}
