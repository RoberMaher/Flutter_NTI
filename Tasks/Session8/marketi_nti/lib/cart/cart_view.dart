import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/cart/widgets/all_products_bloc_builder.dart';
import 'package:marketi_nti/core/app_color.dart';
import 'package:marketi_nti/shared/costom_app_bar.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: costomAppBar(),
      body: AllProductsBlocBuilder(),
    );
  }
}
