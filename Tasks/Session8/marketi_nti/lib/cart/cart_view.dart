// cart/cart_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_nti/cart/cubit/cart_cubit.dart';
import 'package:marketi_nti/home/widgets/product_card.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartSuccess) {
            if (state.cartItems.isEmpty) {
              return const Center(child: Text("Cart is empty 🛒"));
            }

            return GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: state.cartItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                mainAxisExtent: 170,
                childAspectRatio: 152 / 160,
              ),
              itemBuilder: (context, index) {
                final product = state.cartItems[index];

                return ProductCard(
                  product: product,
                  onFavTap: () {},
                  onStarTap: () {},
                  onRemoveTap: () {
                    context.read<CartCubit>().removeFromCart(product);
                  },
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
