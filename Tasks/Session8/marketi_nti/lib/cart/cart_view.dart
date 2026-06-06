import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/cart/cubit/products_cubit.dart';
import 'package:marketi_nti/cart/widgets/product_card.dart';
import 'package:marketi_nti/core/app_color.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 200,
        leading: Row(
          children: [
            SizedBox(width: 20),
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.light_blue_500, width: 4),
              ),
              child: CircleAvatar(
                radius: 20,
                // backgroundImage: AssetImage(''),
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              'Hi, Rober',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/Bell_Icon_UIA.png',
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
        ],
      ),

      body: BlocBuilder<ProductsCubit, ProductsState>(
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
      ),
    );
  }
}
