import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildLoadingState() {
  return Shimmer(
    gradient: LinearGradient(colors: [Colors.grey.shade400,Colors.grey.shade200]),
    child: ListView.builder(
      padding: EdgeInsets.all(12),
      itemCount: 5,
      itemBuilder: (_, _) => Container(
        margin: EdgeInsets.only(bottom: 12),
        height: 110,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
  );
}
