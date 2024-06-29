import 'package:flutter/material.dart' show immutable, IconData, Widget;

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

@immutable
final class ScreenWithPairIcons {
  final PairIcons pairIcons;
  final Widget screen;

  const ScreenWithPairIcons({
    required this.pairIcons,
    required this.screen,
  });
}
