import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../widget/loading_product.dart';
import '../widget/product_list.dart';
import '../cubit/product_cubit.dart';
import '../cubit/product_state.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCubit>(
      create: (context) =>
      GetIt.I<ProductCubit>()
        ..getProducts(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: loadingProduct());
          }

          if (state is ProductFailure) {
            return Center(child: Text(state.message));
          }

          if (state is ProductSuccess) {
            return productList(state.products);
          }
          return const SizedBox();
        },
      ),
    );
  }
}