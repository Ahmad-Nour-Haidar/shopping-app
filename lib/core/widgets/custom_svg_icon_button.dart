import 'package:flutter/material.dart';

import 'svg_image.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String path;
  final String? tooltip;
  final Color? color, backgroundColor;
  final double size;

  const CustomIconButton({
    super.key,
    required this.path,
    required this.onTap,
    this.tooltip = '',
    this.color,
    this.backgroundColor,
    this.size = 22,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      iconSize: size,
      style: backgroundColor == null
          ? null
          : IconButton.styleFrom(
              backgroundColor: backgroundColor,
            ),
      icon: Tooltip(
        message: tooltip,
        preferBelow: false,
        child: SvgImage(
          path: path,
          size: size,
          color: color,
        ),
      ),
    );
  }
}

class CustomSvgIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String path;
  final String? tooltip;
  final Color? color, backgroundColor;
  final double size;

  const CustomSvgIconButton({
    super.key,
    required this.path,
    required this.onTap,
    this.tooltip = '',
    this.color,
    this.backgroundColor,
    this.size = 22,
  });

  @override
  Widget build(BuildContext context) {
    const padding = 3.0;
    final l = size + padding;
    final radius = l / 2;
    return InkWell(
      borderRadius: BorderRadius.circular(radius),
      onTap: onTap,
      child: Container(
        width: l,
        height: l,
        padding: const EdgeInsets.all(padding),
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Tooltip(
          message: tooltip,
          preferBelow: false,
          child: SvgImage(
            path: path,
            size: size,
            color: color,
          ),
        ),
      ),
    );
  }
}
