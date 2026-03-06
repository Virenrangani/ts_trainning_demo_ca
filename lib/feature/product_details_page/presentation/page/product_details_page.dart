import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ts_training_demo_ca/core/constant/color/custom_color.dart';
import 'package:ts_training_demo_ca/core/constant/font_size/custom_text_style.dart';
import 'package:ts_training_demo_ca/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:ts_training_demo_ca/feature/cart/presentation/pages/cart_page.dart';
import 'package:ts_training_demo_ca/feature/product/domain/entity/product_entity.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductEntity product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int count=1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.I<CartCubit>(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.pink.shade300,
                      Colors.pink.shade100,
                      Colors.pink.shade50
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              title: Text(
                widget.product.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: CustomColor.info, fontSize: 16),
              ),
              iconTheme: IconThemeData(color: CustomColor.info),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.white,
                    child: Image.network(
                      widget.product.image,
                      fit: BoxFit.scaleDown,
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Chip(
                      label: Text(
                        widget.product.category.toUpperCase(),
                        style: CustomTextStyles.bodySmall,
                      ),
                      backgroundColor: CustomColor.flip.withOpacity(0.6),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      widget.product.title,
                      style: CustomTextStyles.h3
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${widget.product.price}",
                          style: CustomTextStyles.h2.copyWith(color: CustomColor.success),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.pink.shade50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.pink.shade200),
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                ),
                                onTap: count > 1
                                    ? () => setState(() => count--)
                                    : null,
                                child: Container(
                                  padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: count > 1 ? Colors.pink.shade400 : Colors.grey.shade300,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                  ),
                                  child: Icon(
                                    MdiIcons.minus,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),

                              AnimatedSwitcher(
                                duration: Duration(milliseconds: 200),
                                transitionBuilder: (child, animation) => ScaleTransition(
                                  scale: animation,
                                  child: child,
                                ),
                                child: Padding(
                                  key: ValueKey<int>(count),
                                  padding:  EdgeInsets.symmetric(horizontal: 16),
                                  child: Text(
                                    count.toString(),
                                    style: CustomTextStyles.bodyMedium.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),

                              InkWell(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                                onTap: count < 20
                                    ? () => setState(() => count++)
                                    : null,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: count < 10 ? Colors.pink.shade400 : Colors.grey.shade300,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                    ),
                                  ),
                                  child: Icon(
                                    MdiIcons.plus,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    child: Divider(color: Colors.grey.shade300),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Description",
                      style: CustomTextStyles.bodyLarge
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      widget.product.description!,
                      style: CustomTextStyles.bodySmall
                    ),
                  ),
                ],
              ),
            ),

            bottomNavigationBar: Padding(
              padding:  EdgeInsets.all(20),
              child: ElevatedButton.icon(
                onPressed: ()async {
                  await context.read<CartCubit>().addProduct(
                      widget.product.title,
                      widget.product.category,
                      widget.product.price,
                      widget.product.image
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)=>CartPage()
                      )
                  );
                },
                icon: Icon(Icons.shopping_cart),
                label: Text("Add to Cart", style: TextStyle(fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade400,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}