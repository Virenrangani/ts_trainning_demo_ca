import 'package:flutter/material.dart';
import 'package:ts_training_demo_ca/core/constant/color/custom_color.dart';
import 'package:ts_training_demo_ca/core/constant/font_size/custom_text_style.dart';

class CustomInkwellButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final TextStyle? textStyle;

  const CustomInkwellButton({
    super.key,
    required this.text,
    required this.onTap,
     this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        child: Text(
          text,style: textStyle,
        ),
      ),
    );
  }
}