import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../../core/constant/font_size/custom_text_style.dart';

Widget buildSummaryBar(double total) {
  return Container(
    padding: EdgeInsets.fromLTRB(20, 16, 20, 28),
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
            Text("Subtotal",
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
            Text("Delivery",
                style: CustomTextStyles.bodyMedium
                    .copyWith(color: Colors.grey)),
            Text("FREE",
                style: CustomTextStyles.bodyMedium
                    .copyWith(color: Colors.green)),
          ],
        ),
        Divider(height: 20, color: Colors.grey.shade200),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total", style: CustomTextStyles.h3),
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
            backgroundColor: Colors.pink.shade400,
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
                "Proceed to Checkout",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}