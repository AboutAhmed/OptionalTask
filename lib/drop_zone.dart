import 'package:flutter/material.dart';

class DropZone extends StatelessWidget {
  final Widget child;

  const DropZone({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.blueAccent,
      child: Center(child: child),
    );
  }
}
