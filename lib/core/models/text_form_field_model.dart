import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldModel {
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTapSuffix;
  final ValueChanged<String?>? onFieldSubmitted;
  final ValueChanged<String?>? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Color? colorPrefixIcon;
  final String? prefixIcon;
  final String? suffixIcon;
  final String? helperText;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final bool? enabled;
  final double? sizePrefix;
  final FocusNode? focusNode;
  final int maxLines;
  final int minLines;
  final int? maxLength;
  final int errorMaxLines;
  final EdgeInsetsGeometry contentPadding;
  final Function(PointerDownEvent)? onTapOutside;
  final ScrollPhysics? scrollPhysics;

  TextFormFieldModel({
    this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.colorPrefixIcon,
    this.inputFormatters,
    this.onTapSuffix,
    this.onFieldSubmitted,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.helperText,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.enabled,
    this.sizePrefix,
    this.focusNode,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.errorMaxLines = 3,
    this.contentPadding = defaultPadding,
    this.onTapOutside,
    this.scrollPhysics,
  });

  static const defaultPadding = EdgeInsets.fromLTRB(16, 3, 16, 3);

  static void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
