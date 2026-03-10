import 'package:flutter/material.dart';
import 'package:ts_training_demo_ca/core/constant/border/custom_border_radius.dart';
import 'package:ts_training_demo_ca/core/constant/color/custom_color.dart';
import 'package:ts_training_demo_ca/core/constant/font_size/custom_text_style.dart';
import 'package:ts_training_demo_ca/core/constant/padding/custom_padding.dart';

class CustomCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final IconData? icon;
  final String? buttonText;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final double borderRadius;
  final double elevation;
  final EdgeInsetsGeometry? padding;
  final String? imageUrl;

  const CustomCard({
    super.key,
    this.title,
    this.subtitle,
    this.icon,
    this.buttonText,
    this.onTap,
    this.backgroundColor,
    this.borderRadius = 16,
    this.elevation = 4,
    this.padding,
    this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius),
      onTap: onTap,
      child: Card(
        elevation: elevation,
        color: backgroundColor ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Padding(
          padding: padding ?? CustomPadding.edgeAll16,
          child: Row(
            children: [
              Column(
                children:[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (icon != null)
                        Center(
                          child: Icon(
                            icon,
                            size: 30,
                          ),
                        ),

                      if (icon != null) const SizedBox(height: 8),

                      if (title != null)
                        Center(
                          child: Text(
                            title!,
                            style: CustomTextStyles.bodyLarge
                          ),
                        ),

                      // if (subtitle != null) const SizedBox(height: 6),
                    ],
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                ],
              ),
              if (imageUrl != null)
                ClipRRect(
                  borderRadius: CustomBorderRadius.cir12,
                  child: Image.network(
                    imageUrl!,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}