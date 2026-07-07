// home/product_details.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/auth/widgets/back_button.dart';
import 'package:marketi_nti/auth/widgets/main_button.dart';
import 'package:marketi_nti/cart/cubit/cart_cubit.dart';
import 'package:marketi_nti/home/models/product_model.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Product Details"),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: backButton(),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(product.thumbnail ?? ''),
            SizedBox(height: 10),

            Text(
              product.title ?? '',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              "${product.price} LE",
              style: TextStyle(fontSize: 18.sp, color: Colors.green),
            ),

            Spacer(),

            Padding(
              padding: const EdgeInsets.all(10.0).r,
              child: MainButton(
                text: 'Add to Cart',
                ontap: () {
                  context.read<CartCubit>().addToCart(product);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Added to cart")));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
