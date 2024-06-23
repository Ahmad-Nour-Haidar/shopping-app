import 'package:flutter/material.dart';
import 'package:ptc_quiz2/core/extensions/build_context_extensions.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
    this.elevation,
    this.size,
  });

  final VoidCallback onPressed;
  final Widget child;
  final Size? size;
  final double? elevation;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final currentSize = size ?? Size(context.width / 2, 45);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: elevation,
        minimumSize: currentSize,
        maximumSize: currentSize,
      ),
      child: child,
    );
  }
}
