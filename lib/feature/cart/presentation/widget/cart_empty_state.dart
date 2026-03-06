import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../../core/constant/font_size/custom_text_style.dart';

Widget buildEmptyState() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: Colors.pink.shade50,
            shape: BoxShape.circle,
          ),
          child: Icon(MdiIcons.cartOutline,
              size: 64, color: Colors.pink.shade300),
        ),
        SizedBox(height: 20),
        Text("Your cart is empty", style: CustomTextStyles.h3),
        SizedBox(height: 8),
        Text(
          "Add items to get started",
          style:
          CustomTextStyles.bodySmall.copyWith(color: Colors.grey),
        ),
      ],
    ),
  );
}
