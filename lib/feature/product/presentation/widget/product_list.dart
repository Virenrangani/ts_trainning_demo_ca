import 'package:flutter/material.dart';
import 'package:ts_training_demo_ca/core/constant/padding/custom_padding.dart';
import 'package:ts_training_demo_ca/feature/dashboard/presentation/widgets/scrollable_card.dart';
import '../../../../core/constant/border/custom_border_radius.dart';
import '../../../../core/constant/color/custom_color.dart';
import '../../domain/entity/product_entity.dart';
import '../../../product_details_page/presentation/page/product_details_page.dart';

Widget productList(List<ProductEntity> products) {
  return CustomScrollView(
    slivers: [
      SliverToBoxAdapter(
        child: ScrollableCard(),
      ),

      SliverPadding(
        padding: CustomPadding.edgeAll12,
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              final product = products[index];
              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: CustomBorderRadius.cir12,
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context)=>ProductDetailPage(product:product))
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.pink.shade400, Colors.pink.shade100],
                      ),
                      borderRadius: CustomBorderRadius.cir12,
                      border: Border.all(
                        color: CustomColor.general.withOpacity(0.5),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: CustomBorderRadius.verTop12,
                            child: Image.network(
                              product.image,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: CustomPadding.edgeAll8,
                          child: Text(
                            product.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: CustomPadding.edgeSymmetricHori8,
                          child: Text(
                            "\$${product.price}",
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              );
            },
            childCount: products.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.65,
          ),
        ),
      ),
    ],
  );
}
