// cart/cubit/cart_state.dart
part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartSuccess extends CartState {
  final List<ProductModel> cartItems;

  CartSuccess(this.cartItems);
}