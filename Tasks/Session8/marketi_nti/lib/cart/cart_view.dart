import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_nti/cart/cubit/products_cubit.dart';
import 'package:marketi_nti/cart/widgets/all_products_bloc_builder.dart';
import 'package:marketi_nti/shared/costom_app_bar.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..GetAllProducts(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: costomAppBar(),
        body: AllProductsBlocBuilder(),
      ),
    );
  }
}
