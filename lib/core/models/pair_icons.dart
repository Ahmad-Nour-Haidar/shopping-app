import 'package:flutter/material.dart' show immutable, IconData;

@immutable
final class PairIcons {
  final IconData filledIcon;
  final IconData outlinedIcon;

  const PairIcons({
    required this.filledIcon,
    required this.outlinedIcon,
  });

  IconData getIcon(bool isActive) => isActive ? filledIcon : outlinedIcon;
}
