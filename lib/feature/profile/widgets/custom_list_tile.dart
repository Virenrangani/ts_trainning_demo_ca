import 'package:flutter/material.dart';
import 'package:ts_training_demo_ca/core/constant/padding/custom_padding.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  const CustomListTile({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(vertical:8,horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black26, width: 1.5),
        color: Colors.white.withOpacity(0.6),
      ),
      child: ListTile(
        contentPadding:CustomPadding.edgeSymmetricHori12,
        leading: Icon(
          icon,
          color: Colors.black87,
        ),
        title: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 18,
          color: Colors.black54,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onTap: () {},
      ),
    );
  }
}