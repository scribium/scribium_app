import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  final Size? size;
  final EdgeInsetsGeometry margin;
  final Widget child;

  const Card({
    required this.child,
    this.size,
    this.margin = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size != null ? size!.height : null,
      width: size != null ? size!.width : null,
      margin: margin,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: child,
    );
  }
}
