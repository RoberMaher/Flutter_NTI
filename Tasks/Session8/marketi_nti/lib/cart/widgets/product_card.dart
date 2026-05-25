import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.item});

  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 145.h,
          width: double.infinity,
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100.h,
                  width: double.infinity,
                  child: Image.network(item['thumbnail'], fit: BoxFit.contain),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      item['title'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(child: Text('\$${item['price']}')),
        ),
      ],
    );
  }
}
