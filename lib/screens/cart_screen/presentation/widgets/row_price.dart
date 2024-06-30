import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_style.dart';

class RowPrice extends StatelessWidget {
  const RowPrice({
    super.key,
    required this.title,
    required this.price,
  });

  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle.f16w400darkGrey,
          ),
          Text(
            price,
            style: AppTextStyle.f16w600darkGrey,
          ),
        ],
      ),
    );
  }
}
