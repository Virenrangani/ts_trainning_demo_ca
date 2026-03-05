import 'package:flutter/material.dart';
import 'package:ts_training_demo_ca/core/constant/color/custom_color.dart';
import 'package:ts_training_demo_ca/core/constant/font_size/custom_text_style.dart';

class CustomSnacksBar {

  static void showSuccess(BuildContext context, String message) {
    showSnackBar(
      context,
      message,
      backgroundColor: CustomColor.success,
      icon: Icons.check_circle,
    );
  }

  static void showError(BuildContext context, String message) {
    showSnackBar(
      context,
      message,
      backgroundColor: CustomColor.error,
      icon: Icons.error,
    );
  }

  static void showInfo(BuildContext context, String message) {
    showSnackBar(
      context,
      message,
      backgroundColor: CustomColor.info,
      icon: Icons.info,
    );
  }

  static void showSnackBar(
      BuildContext context,
      String message,
      {
        required Color backgroundColor,
        required IconData icon,
      }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        elevation: 6,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        duration: const Duration(seconds: 3),
        content: Row(
          children: [
            Icon(icon, color: CustomColor.surface),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: CustomTextStyles.bodySmall
              ),
            ),
          ],
        ),
      ),
    );
  }
}