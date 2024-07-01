import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../assets/app_svg.dart';
import '../theme/app_color.dart';
import 'svg_image.dart';

class CustomArrowButton extends StatelessWidget {
  const CustomArrowButton({
    super.key,
    this.onPressed,
    this.color = AppColor.black,
    this.backgroundColor,
    this.size = const Size(50, 50),
    this.flipX,
  });

  final VoidCallback? onPressed;
  final Color? color, backgroundColor;
  final Size size;
  final bool? flipX;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Center(
        child: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: backgroundColor,
            minimumSize: size,
            maximumSize: size,
            padding: const EdgeInsets.all(5),
          ),
          onPressed: onPressed ??
              () {
                if (context.canPop()) {
                  context.pop();
                }
              },
          icon: SvgImage(
            path: AppSvg.arrowLeft,
            size: 26,
            color: color,
          ),
        ),
      ),
    );
  }
}
