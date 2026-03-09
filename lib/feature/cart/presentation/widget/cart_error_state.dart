import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ts_training_demo_ca/core/constant/string/custom_string.dart';
import '../../../../core/constant/font_size/custom_text_style.dart';
class CartErrorState extends StatelessWidget {
  final String message;
  const CartErrorState({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(MdiIcons.alertCircleOutline,
              size: 56, color: Colors.red.shade300),
          SizedBox(height: 12),
          Text(CustomString.somethingWentWrong, style: CustomTextStyles.h3),
          SizedBox(height: 8),
          Text(
            message,
            style: CustomTextStyles.bodySmall.copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}