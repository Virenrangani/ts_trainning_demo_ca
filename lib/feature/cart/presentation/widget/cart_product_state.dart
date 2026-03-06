import 'package:flutter/material.dart';
import 'package:ts_training_demo_ca/feature/cart/domain/entity/product_entity.dart';
import '../../../../core/constant/font_size/custom_text_style.dart';
import 'cart_summary.dart';

Widget buildCartList(BuildContext context, List<ProductEntity> products) {
  final double total = products.fold(0, (sum, p) => sum + p.price);

  return Column(
    children: [
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        color: Colors.white,
        child: Text(
          "${products.length} item${products.length > 1 ? 's' : ''} in your cart",
          style: CustomTextStyles.bodySmall.copyWith(color: Colors.grey),
        ),
      ),

      Expanded(
        child: ListView.builder(
          padding: EdgeInsets.all(12),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return _buildCartItem(products[index]);
          },
        ),
      ),

      buildSummaryBar(total),
    ],
  );
}

Widget _buildCartItem(ProductEntity product) {
  return Container(
    margin: EdgeInsets.only(bottom: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.pink.shade50,
          blurRadius: 8,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 85,
              height: 85,
              color: Colors.grey.shade100,
              child: Image.network(
                product.image,
                fit: BoxFit.contain,
                errorBuilder: (_, _, _) => Icon(
                  Icons.image_not_supported_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
          ),

          SizedBox(width: 12),

          // Product info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    product.category.toUpperCase(),
                    style: TextStyle(
                      fontSize: 9,
                      color: Colors.pink.shade400,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),

                SizedBox(height: 6),

                Text(
                  product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "\$${product.price.toStringAsFixed(2)}",
                  style: CustomTextStyles.bodyLarge.copyWith(
                    color: Colors.green.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}