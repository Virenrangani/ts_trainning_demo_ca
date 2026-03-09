import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ts_training_demo_ca/feature/cart/domain/entity/product_entity.dart';
import 'package:ts_training_demo_ca/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:ts_training_demo_ca/feature/cart/presentation/widget/increment_decrement.dart';
import '../../../../core/constant/font_size/custom_text_style.dart';
import 'cart_summary.dart';

class CartList extends StatefulWidget {
  final List<ProductEntity> products;
  final BuildContext context;

  const CartList({super.key, required this.products, required this.context});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {

  late List<int> counts;

  @override
  void initState() {
    super.initState();
    counts = List.generate(widget.products.length, (index) => 1);
  }

  double getTotal() {
    double total = 0;
    for (int i = 0; i < widget.products.length; i++) {
      total += widget.products[i].price * counts[i];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {

    final total = getTotal();

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          color: Colors.white,
          child: Text(
            "${widget.products.length} item${widget.products.length > 1 ? 's' : ''} in your cart",
            style: CustomTextStyles.bodySmall.copyWith(color: Colors.grey),
          ),
        ),

        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(12),
            itemCount: widget.products.length,
            itemBuilder: (context, index) {
              return CartItemCard(
                product: widget.products[index],
                count: counts[index],
                onIncrement: () {
                  setState(() {
                    if (counts[index] < 20) counts[index]++;
                  });
                },
                onDecrement: () {
                  setState(() {
                    if (counts[index] > 1) counts[index]--;
                  });
                },
              );
            },
          ),
        ),

        buildSummaryBar(total),
      ],
    );
  }
}

class CartItemCard extends StatelessWidget {
  final ProductEntity product;
  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItemCard({
    super.key,
    required this.product,
    required this.count,
    required this.onIncrement,
    required this.onDecrement
  });
  
  @override
  Widget build(BuildContext context) {
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
                        "\$${(product.price * count).toStringAsFixed(2)}",
                        style: CustomTextStyles.bodyLarge.copyWith(
                          color: Colors.green.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 8),

                Column(
                  children: [
                    IncrementDecrement(
                      count: count,
                      onIncrement: onIncrement,
                      onDecrement: onDecrement
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<CartCubit>().removeItem(product.id);
                      },
                      icon: Icon(MdiIcons.delete, color: Colors.red.shade300),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
  }
}