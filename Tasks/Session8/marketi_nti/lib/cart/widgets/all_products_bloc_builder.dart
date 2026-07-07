// cart/widgets/all_products_bloc_builder.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_nti/home/cubit/products_cubit.dart';
import 'package:marketi_nti/cart/widgets/product_card.dart';

class AllProductsBlocBuilder extends StatelessWidget {
  const AllProductsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductsSuccess) {
          return GridView.builder(
            itemCount: state.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (BuildContext context, int index) {
              return ProductCard(
                index: index,
                productModel: state.products[index],
              );
            },
          );
        } else if (state is ProductsFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
