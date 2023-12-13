import 'package:animations/utils/extentions.dart';
import 'package:flutter/material.dart';

class FilterButtonStyle extends StatelessWidget {
  final Widget child;
  final Color? color;
  final void Function()? onTap;
  final BoxShape? boxShape;

  const FilterButtonStyle(
      {super.key, required this.child, this.color, this.onTap, this.boxShape});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: boxShape != null
            ? const EdgeInsets.all(16)
            : const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: color ?? context.colors.buttonDisable,
          borderRadius: boxShape != null ? null : BorderRadius.circular(40),
          shape: boxShape ?? BoxShape.rectangle,
        ),
        child: child,
      ),
    );
  }
}
