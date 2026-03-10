import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ts_training_demo_ca/core/constant/border/custom_border_radius.dart';
import 'package:ts_training_demo_ca/core/constant/color/custom_color.dart';
import 'package:ts_training_demo_ca/core/constant/font_size/custom_text_style.dart';
import 'package:ts_training_demo_ca/core/constant/padding/custom_padding.dart';
import 'package:ts_training_demo_ca/core/constant/string/custom_string.dart';
import 'package:ts_training_demo_ca/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:ts_training_demo_ca/feature/cart/presentation/pages/cart_page.dart';
import 'package:ts_training_demo_ca/feature/product/domain/entity/product_entity.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailPage({super.key, required this.product});

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
                product.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: CustomColor.info, fontSize: 16),
              ),
              iconTheme: IconThemeData(color: CustomColor.info),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: CustomPadding.edgeAll16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 300,
                      color: Colors.white,
                      child: Image.network(
                        product.image,
                        fit: BoxFit.scaleDown,
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Chip(
                          label: Text(
                            product.category.toUpperCase(),
                            style: CustomTextStyles.bodySmall,
                          ),
                          backgroundColor: CustomColor.flip.withOpacity(0.6),
                        ),
                        Column(
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(MdiIcons.send,size: 30,),),
                            IconButton(onPressed: (){}, icon: Icon(MdiIcons.heartPlus,size: 30,),),
                          ],
                        )
                      ],
                    ),

                    Text(
                      product.title,
                      style: CustomTextStyles.h3
                    ),

                     Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${product.price}",
                            style: CustomTextStyles.h2.copyWith(color: CustomColor.success),
                          ),
                        ],
                      ),

                    Padding(
                      padding: CustomPadding.edgeSymmetricHori12Ver8,
                      child: Divider(color: Colors.grey.shade300),
                    ),

                    Text(CustomString.description,
                      style: CustomTextStyles.bodyLarge
                    ),
                    Text(
                      product.description!,
                      style: CustomTextStyles.bodySmall
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding:  CustomPadding.edgeAll20,
              child: ElevatedButton.icon(
                onPressed: ()async {
                  await context.read<CartCubit>().addProduct(
                      product.title,
                      product.category,
                      product.price,
                      product.image
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)=>CartPage()
                      )
                  );
                },
                label: Shimmer.fromColors(
                    period: Duration(seconds: 5),
                    baseColor: Colors.white70,
                    highlightColor: Colors.black,
                    child: Text(CustomString.addToCart, style: CustomTextStyles.h3)
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade400,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: CustomBorderRadius.cir8
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