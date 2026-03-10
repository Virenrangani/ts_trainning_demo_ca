import 'package:flutter/material.dart';
import 'package:ts_training_demo_ca/core/constant/color/custom_color.dart';
import '../../../core/constant/border/custom_border_radius.dart';

class CustomCard extends StatelessWidget {
  final IconData icon;
  final String text ;
  final VoidCallback onTap;
  const CustomCard({super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: CustomBorderRadius.cir24,
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: CustomColor.textSecondary,
        borderRadius: CustomBorderRadius.cir24,
        child: SizedBox(
          height:MediaQuery.sizeOf(context).height*0.1,
          width: MediaQuery.sizeOf(context).height*0.09,
          child: Card(
            elevation: 8,
            shadowColor: Colors.black.withOpacity(0.3),
            color:CustomColor.general.withOpacity(0.7),
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: CustomBorderRadius.cir24,
              side: const BorderSide(color: Colors.white24, width: 2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: CustomColor.textLight),
                const SizedBox(height: 5),
                Flexible(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: CustomColor.textLight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
