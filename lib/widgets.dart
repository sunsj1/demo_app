import 'package:flutter/material.dart';
class LeftBorderCard extends StatelessWidget {
  final Widget child;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final EdgeInsets padding;

  LeftBorderCard({
    required this.child,
    this.borderColor = Colors.black,
    this.borderWidth = 2.0,
    this.borderRadius = 0.0,
    this.padding = const EdgeInsets.all(16.0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}