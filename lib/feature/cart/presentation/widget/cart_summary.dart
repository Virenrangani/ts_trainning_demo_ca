import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ts_training_demo_ca/core/constant/color/custom_color.dart';
import 'package:ts_training_demo_ca/core/constant/string/custom_string.dart';
import '../../../../core/constant/font_size/custom_text_style.dart';
import '../../../../core/constant/padding/custom_padding.dart';
class CartSummary extends StatelessWidget {
  final double total;
  const CartSummary({super.key, required this.total});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CustomPadding.edgeAll20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 16,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(CustomString.subTotal,
                  style: CustomTextStyles.bodyMedium
                      .copyWith(color: Colors.grey)),
              Text("\$${total.toStringAsFixed(2)}",
                  style: CustomTextStyles.bodyMedium),
            ],
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(CustomString.delivery,
                  style: CustomTextStyles.bodyMedium
                      .copyWith(color: Colors.grey)),
              Text(CustomString.free,
                  style: CustomTextStyles.bodyMedium
                      .copyWith(color: Colors.green)),
            ],
          ),
          Divider(height: 20, color: Colors.grey.shade200),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(CustomString.total, style: CustomTextStyles.h3),
              Text(
                "\$${total.toStringAsFixed(2)}",
                style: CustomTextStyles.h2
                    .copyWith(color: Colors.green.shade700),
              ),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColor.flip.withOpacity(0.8),
              foregroundColor: Colors.white,
              minimumSize: Size(double.infinity, 52),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(MdiIcons.flashOutline, size: 20),
                SizedBox(width: 8),
                Text(
                    CustomString.checkOut,
                    style: CustomTextStyles.bodyLarge
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}