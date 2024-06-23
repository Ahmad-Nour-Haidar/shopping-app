import 'package:flutter/foundation.dart' show immutable;

@immutable
class OnboardingItem {
  final String title;
  final String subTitle;

  const OnboardingItem({
    required this.title,
    required this.subTitle,
  });
}
