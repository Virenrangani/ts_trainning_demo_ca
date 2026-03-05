import 'package:flutter/material.dart';

Widget customListTile(IconData icon, String text) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical:8,horizontal: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.black26, width: 1.5),
      color: Colors.white.withOpacity(0.6),
    ),
    child: ListTile(
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 12),
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