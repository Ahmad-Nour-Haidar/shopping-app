import 'package:flutter/material.dart';
import 'package:ptc_quiz2/core/widgets/svg_image.dart';

import '../models/text_form_field_model.dart';
import '../theme/app_color.dart';
import '../theme/app_text_style.dart';
import 'custom_svg_icon_button.dart';

class CustomTextFormFieldModel extends StatefulWidget {
  const CustomTextFormFieldModel({
    super.key,
    required this.model,
  });

  final TextFormFieldModel model;

  @override
  State<CustomTextFormFieldModel> createState() =>
      _CustomTextFormFieldModelState();
}

class _CustomTextFormFieldModelState extends State<CustomTextFormFieldModel> {
  // TextDirection get textDirection {
  //   if (widget.model.controller.text.isEmpty) {
  //     return context.isEnglish ? TextDirection.ltr : TextDirection.rtl;
  //   }
  //   return widget.model.controller.text.isArabicOnly
  //       ? TextDirection.rtl
  //       : TextDirection.ltr;
  // }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollPhysics: widget.model.scrollPhysics,
      enabled: widget.model.enabled,
      controller: widget.model.controller,
      focusNode: widget.model.focusNode,
      onFieldSubmitted: widget.model.onFieldSubmitted,
      onTapOutside: widget.model.onTapOutside,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // textDirection: textDirection,
      validator: widget.model.validator,
      obscureText: widget.model.obscureText,
      textInputAction: widget.model.textInputAction,
      keyboardType: widget.model.keyboardType,
      style: AppTextStyle.f16w400darkGrey,
      maxLines: widget.model.maxLines,
      minLines: widget.model.minLines,
      maxLength: widget.model.maxLength,
      onChanged: widget.model.onChanged ?? (_) => setState(() {}),
      inputFormatters: widget.model.inputFormatters,
      decoration: InputDecoration(
        helperText: widget.model.helperText,
        labelText: widget.model.labelText,
        hintText: widget.model.hintText,
        errorMaxLines: widget.model.errorMaxLines,
        contentPadding: widget.model.contentPadding,
        prefixIcon: widget.model.prefixIcon != null
            ? SvgImage(
                path: widget.model.prefixIcon!,
                color: AppColor.grey,
                size: 20,
              )
            : null,
        suffixIcon: widget.model.suffixIcon != null
            ? CustomIconButton(
                onTap: widget.model.onTapSuffix,
                path: widget.model.suffixIcon!,
                color: AppColor.grey,
                size: 20,
              )
            : null,
      ),
    );
  }
}
