import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension BuildContextExtensions on BuildContext {
  Size get size => MediaQuery.sizeOf(this);

  double get width => size.width;

  double get height => size.height;

  ThemeData get theme => Theme.of(this);

  Object? get extra => GoRouterState.of(this).extra;
}
