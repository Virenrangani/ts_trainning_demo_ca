import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ts_training_demo_ca/core/constant/padding/custom_padding.dart';
import '../../../../core/constant/font_size/custom_text_style.dart';
import '../../../../core/constant/string/custom_string.dart';
class CartEmptyState extends StatelessWidget {
  const CartEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding:CustomPadding.edgeAll20,
            decoration: BoxDecoration(
              color: Colors.pink.shade50,
              shape: BoxShape.circle,
            ),
            child: Icon(MdiIcons.cartOutline,
                size: 64, color: Colors.pink.shade300),
          ),
          SizedBox(height: 20),
          Text(CustomString.cartEmpty, style: CustomTextStyles.h3),
          SizedBox(height: 8),
          Text(
            CustomString.cartAdded,
            style:
            CustomTextStyles.bodySmall.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}