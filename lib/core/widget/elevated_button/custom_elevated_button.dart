import 'package:flutter/material.dart';
import 'package:ts_training_demo_ca/core/constant/color/custom_color.dart';
import 'package:ts_training_demo_ca/core/constant/font_size/custom_text_style.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final double? width;
  final double? height;
  final double? borderRadius;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.width,
    this.height,
    this.borderRadius=15,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:CustomColor.primaryDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
        ),
        child: isLoading
            ? SizedBox(
          height: 22,
          width: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: CustomColor.border,
          ),
        )
            : Text(
          text,
          style: CustomTextStyles.button
        ),
      ),
    );
  }
}
