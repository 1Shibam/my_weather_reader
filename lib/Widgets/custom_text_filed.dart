import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_weather_reader/themes/text_styles.dart';

class CustomTextFiled extends ConsumerStatefulWidget {
  final String label;
  final String hintText;
  const CustomTextFiled(
      {super.key, required this.hintText, required this.label});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomTextFiledState();
}

class _CustomTextFiledState extends ConsumerState<CustomTextFiled> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          label: Text(widget.label),
          hintText: widget.hintText,
          hintStyle: AppTextStyles.heading2,
          labelStyle: AppTextStyles.heading2,
          floatingLabelStyle:
              AppTextStyles.regular.copyWith(color: Colors.white)),
    );
  }
}
