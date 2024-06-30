import 'package:flutter/material.dart';

import '../theme/app_color.dart';
import '../utils/values_manager.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    this.size = AppSize.s55,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.image_outlined,
      size: size,
      color: AppColor.lightGrey,
    );
  }
}