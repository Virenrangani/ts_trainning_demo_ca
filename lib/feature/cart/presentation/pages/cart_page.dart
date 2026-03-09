import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ts_training_demo_ca/core/constant/color/custom_color.dart';
import 'package:ts_training_demo_ca/core/constant/font_size/custom_text_style.dart';
import 'package:ts_training_demo_ca/core/constant/string/custom_string.dart';
import 'package:ts_training_demo_ca/core/widget/snack_bar/custom_snack_bar.dart';
import 'package:ts_training_demo_ca/feature/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:ts_training_demo_ca/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:ts_training_demo_ca/feature/cart/presentation/cubit/cart_state.dart';
import '../widget/cart_empty_state.dart';
import '../widget/cart_error_state.dart';
import '../widget/cart_loading_state.dart';
import '../widget/cart_product_state.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.I<CartCubit>()..getProduct(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.grey.shade50,
            appBar: AppBar(
              elevation: 0,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.pink.shade300,
                      Colors.pink.shade100,
                      Colors.pink.shade50,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              leading: IconButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavBar())),
                icon: Icon(Icons.arrow_back_ios, color: CustomColor.info),
              ),
              title: Text(
                CustomString.myCart,
                style: CustomTextStyles.h3.copyWith(color: CustomColor.info),
              ),
            ),

            body: BlocConsumer<CartCubit, CartState>(
              listener: (context, state) {
                if (state is CartAddProduct) {
                  CustomSnacksBar.showSuccess(context, "${state.product.title}+ ${CustomString.added}");
                  context.read<CartCubit>().getProduct();
                }

                if (state is CartFailure) {
                  CustomSnacksBar.showError(context, state.message);
                }
              },
              builder: (context, state) {

                if (state is CartLoading) {
                  return CartLoadingState();
                }

                if (state is CartSuccess) {
                  if (state.product.isEmpty) {
                    return CartEmptyState();
                  }
                  return CartList(products: state.product, context: context,);
                }

                if (state is CartFailure) {
                  return CartErrorState(message:state.message);
                }

                return CartEmptyState();
              },
            ),
          );
        },
      ),
    );
  }
}

