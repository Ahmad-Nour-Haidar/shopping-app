import 'package:flutter/material.dart';
import 'package:ptc_quiz2/core/theme/app_text_style.dart';

import '../models/text_form_field_model.dart';
import 'custom_text_form_field_model.dart';

class TextFormFieldWithTitle extends StatelessWidget {
  final String title;
  final TextFormFieldModel model;

  const TextFormFieldWithTitle({
    super.key,
    required this.title,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.f14w600darkBlue,
        ),
        CustomTextFormFieldModel(model: model),
      ],
    );
  }
}
