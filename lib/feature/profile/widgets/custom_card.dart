import 'package:flutter/material.dart';
import 'package:ts_training_demo_ca/core/constant/color/custom_color.dart';
class CustomCard extends StatelessWidget {
  final IconData icon;
  final String text ;
  final VoidCallback onTap;
  const CustomCard({super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 80,
        width: 80,
        child: Card(
          elevation: 8,
          shadowColor: Colors.black.withOpacity(0.3),
          color:CustomColor.general.withOpacity(0.7) ,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(color: Colors.white24, width: 2),
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
    );
  }
}
