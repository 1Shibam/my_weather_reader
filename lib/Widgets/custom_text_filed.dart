import 'package:flutter/material.dart';

import 'package:my_weather_reader/themes/text_styles.dart';

class CustomTextFiled extends StatelessWidget {
  final bool canRequestFocus;
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autoFocus;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  const CustomTextFiled(
      {super.key,
      this.canRequestFocus = true,
      required this.hintText,
      required this.label,
      this.onTap,
      this.onChanged,
      this.autoFocus = false,
      this.controller,
      this.focusNode,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyles.bold,
      controller: controller,
      focusNode: focusNode,
      canRequestFocus: canRequestFocus,
      onTap: onTap,
      onChanged: onChanged,
      autofocus: autoFocus,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          label: Text(label),
          hintText: hintText,
          hintStyle: AppTextStyles.heading2,
          labelStyle: AppTextStyles.heading2,
          floatingLabelStyle:
              AppTextStyles.regular.copyWith(color: Colors.white)),
    );
  }
}
