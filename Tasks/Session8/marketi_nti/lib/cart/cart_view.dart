import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

      body: FutureBuilder(
        future: getAllProducts(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());

            case ConnectionState.done:
              if (snapshot.hasData && snapshot.data != null) {
                final data = snapshot.data as Map<String, dynamic>;

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: data['products'].length,
                  itemBuilder: (context, index) => Column(
                    children: [ProductCard(item: data['products'][index])],
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error ${snapshot.error}'));
              } else {
                return const Center(child: Text('No data'));
              }

            case ConnectionState.none:
              return Center(child: Text('No connection'));

            case ConnectionState.active:
              return Center(child: Text('Active connection'));
          }
        },
      ),
    );

    // get all products function
  }
}
