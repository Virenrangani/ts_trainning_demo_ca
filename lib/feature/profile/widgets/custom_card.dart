import 'package:flutter/material.dart';
import 'package:ts_training_demo_ca/core/constant/color/custom_color.dart';

Widget customCards(IconData icon, String text ,VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: SizedBox(
      height: 80,
      width: 80,
      child: Card(
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.3),
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: const BorderSide(color: Colors.white24, width: 2),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: CustomColor.general.withOpacity(0.7),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: CustomColor.textLight),
              const SizedBox(height: 5),
              Text(
                text,
                style: TextStyle(color: CustomColor.textLight),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}