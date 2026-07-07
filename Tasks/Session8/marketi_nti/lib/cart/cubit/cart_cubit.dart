// cart/cubit/cart_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:marketi_nti/home/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartSuccess([]));

  void addToCart(ProductModel product) {
    final currentState = state;

    if (currentState is CartSuccess) {
      final updated = List<ProductModel>.from(currentState.cartItems);

      updated.add(product);

      emit(CartSuccess(updated));
    }
  }

  void removeFromCart(ProductModel product) {
    final currentState = state;

    if (currentState is CartSuccess) {
      final updated = List<ProductModel>.from(currentState.cartItems);

      updated.remove(product);

      emit(CartSuccess(updated));
    }
  }
}
