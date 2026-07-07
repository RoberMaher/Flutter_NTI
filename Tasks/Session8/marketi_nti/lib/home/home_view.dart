// home/home_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/fav/cubit/fav_cubit.dart';
import 'package:marketi_nti/home/cubit/products_cubit.dart';
import 'package:marketi_nti/home/models/product_model.dart';
import 'package:marketi_nti/home/widgets/brand_item.dart';
import 'package:marketi_nti/home/widgets/category_item.dart';
import 'package:marketi_nti/home/widgets/scrolled_offers.dart';
import 'package:marketi_nti/home/widgets/scrolled_products.dart';
import 'package:marketi_nti/home/widgets/search_bar.dart';
import 'package:marketi_nti/home/widgets/section_title.dart';
import 'package:marketi_nti/home/home_data.dart';
import 'package:marketi_nti/shared/costom_app_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: costomAppBar(),
      body: Column(
        children: [
          const CustomSearchBar(),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// 🔹 Offers
                  ScrolledOffer(items: HomeData.offers),

                  const SectionTitle(title: "Popular Product"),

                  /// 🔹 Popular Products
                  BlocBuilder<FavCubit, FavState>(
                    builder: (context, state) {
                      return BlocBuilder<ProductsCubit, ProductsState>(
                        builder: (context, state) {
                          final isLoading = state is ProductsLoading;

                          List<ProductModel> products = [];

                          if (state is ProductsSuccess) {
                            products = state.products;
                          } else {
                            products = List.generate(
                              6,
                              (_) => ProductModel.fake(),
                            );
                          }

                          if (state is ProductsFailure) {
                            return Center(child: Text(state.errorMessage));
                          }

                          return Skeletonizer(
                            enabled: isLoading,
                            child: ScrolledProducts(
                              products: products,
                              onFavTap: (product) {
                                if (!isLoading) {
                                  context.read<FavCubit>().toggleFav(product);
                                }
                              },
                              onStarTap: (product) {
                                if (!isLoading) {
                                  context.read<ProductsCubit>().toggleStar(
                                    product,
                                  );
                                }
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),

                  SizedBox(height: 10.h),

                  /// 🔹 Categories
                  const SectionTitle(title: "Category"),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                    itemCount: HomeData.categories.length,
                    itemBuilder: (context, index) => CategoryItem(
                      title: HomeData.categories[index].title,
                      image: HomeData.categories[index].image,
                    ),
                  ),

                  /// 🔹 Best for You
                  const SectionTitle(title: "Best for You"),

                  BlocBuilder<FavCubit, FavState>(
                    builder: (context, state) {
                      return BlocBuilder<ProductsCubit, ProductsState>(
                        builder: (context, state) {
                          if (state is ProductsSuccess) {
                            return ScrolledProducts(
                              products: state.products,
                              onFavTap: (product) {
                                context.read<FavCubit>().toggleFav(product);
                              },
                              onStarTap: (product) {
                                context.read<ProductsCubit>().toggleStar(
                                  product,
                                );
                              },
                            );
                          }
                          return const SizedBox();
                        },
                      );
                    },
                  ),

                  /// 🔹 Brands
                  const SectionTitle(title: "Brands"),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                    itemCount: HomeData.brands.length,
                    itemBuilder: (context, index) =>
                        BrandItem(image: HomeData.brands[index].image),
                  ),

                  /// 🔹 Buy Again
                  const SectionTitle(title: "Buy Again"),

                  BlocBuilder<ProductsCubit, ProductsState>(
                    builder: (context, state) {
                      if (state is ProductsSuccess) {
                        return ScrolledProducts(
                          products: state.products,
                          onFavTap: (product) {
                            context.read<FavCubit>().toggleFav(product);
                          },
                          onStarTap: (product) {
                            context.read<ProductsCubit>().toggleStar(product);
                          },
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
