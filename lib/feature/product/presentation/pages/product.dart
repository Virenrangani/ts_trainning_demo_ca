import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ts_training_demo_ca/core/constant/color/custom_color.dart';
import 'package:ts_training_demo_ca/feature/product_details_page/presentation/product_details_page.dart';
import '../../../dashboard/presentation/widgets/scrollable_card.dart';
import '../cubit/product_cubit.dart';
import '../../domain/entity/product_entity.dart';
import '../cubit/product_state.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCubit>(
        create: (context) => GetIt.I<ProductCubit>()..getProducts(),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {

            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProductFailure) {
              return Center(child: Text(state.message));
            }

            if (state is ProductSuccess) {
              return _buildProductList(state.products);
            }
            return const SizedBox();
          },
        ),
    );
  }

  Widget _buildProductList(List<ProductEntity> products) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: scrollableCards(),
          ),
        ),

        SliverPadding(
          padding: const EdgeInsets.all(12),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final product = products[index];
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context)=>ProductDetailPage(product:product))
                      );
                      print(product.title);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.pink.shade400, Colors.pink.shade100],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: CustomColor.general.withOpacity(0.5),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                              child: Image.network(
                                product.image,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              product.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
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
}