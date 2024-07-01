import 'package:flutter/material.dart';

import '../theme/app_color.dart';
import '../utils/values_manager.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    this.size = AppSize.s55,
    this.color = AppColor.lightGrey,
  });

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.image_outlined,
      size: size,
      color: color,
    );
  }
}
