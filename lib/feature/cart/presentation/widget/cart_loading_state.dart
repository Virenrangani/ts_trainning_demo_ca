import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ts_training_demo_ca/core/constant/padding/custom_padding.dart';
class CartLoadingState extends StatelessWidget {
  const CartLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(colors: [Colors.grey.shade400,Colors.grey.shade200]),
      child: ListView.builder(
        padding: CustomPadding.edgeAll12,
        itemCount: 5,
        itemBuilder: (_,_) => Container(
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
}
