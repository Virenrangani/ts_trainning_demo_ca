import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../../core/constant/font_size/custom_text_style.dart';

Widget buildErrorState(String message) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(MdiIcons.alertCircleOutline,
            size: 56, color: Colors.red.shade300),
        SizedBox(height: 12),
        Text("Something went wrong", style: CustomTextStyles.h3),
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