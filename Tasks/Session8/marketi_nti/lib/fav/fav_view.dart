// fav/fav_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/home/widgets/product_card.dart';
import 'package:marketi_nti/fav/cubit/fav_cubit.dart';

class FavView extends StatelessWidget {
  const FavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorites"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: BlocBuilder<FavCubit, FavState>(
          builder: (context, state) {
            final favItems = context.read<FavCubit>().favItems;

            if (state is FavLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (favItems.isEmpty) {
              return const Center(child: Text("No favorites yet"));
            }

            return GridView.builder(
              itemCount: favItems.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                mainAxisExtent: 180.h,
              ),
              itemBuilder: (context, index) {
                final product = favItems[index];

                return ProductCard(
                  product: product,
                  onFavTap: () {
                    context.read<FavCubit>().toggleFav(product);
                  },
                  onStarTap: () {},
                  onRemoveTap: () {
                    context.read<FavCubit>().removeFromFav(product);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
