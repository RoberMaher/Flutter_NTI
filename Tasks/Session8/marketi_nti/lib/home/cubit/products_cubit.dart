// home/cubit/products_cubit.dart
// home/cubit/products_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marketi_nti/core/networking/api_consumer.dart';
import 'package:marketi_nti/home/models/product_model.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ApiConsumer apiConsumer;

  ProductsCubit({required this.apiConsumer}) : super(ProductsInitial());

  Future<void> getAllProducts() async {
    emit(ProductsLoading());

    try {
      final response = await apiConsumer.get(url: 'https://dummyjson.com/products');

      Map<String, dynamic> data = response.data;

      List productsJson = data['products'];

      List<ProductModel> products = productsJson
          .map((e) => ProductModel.fromJson(e))
          .toList();

      emit(ProductsSuccess(products));
    } on DioException catch (e) {
      emit(ProductsFailure(e.message ?? "Network error"));
    } catch (e) {
      emit(ProductsFailure("Unexpected error"));
    }
  }

  void toggleFav(ProductModel product) {
    if (state is! ProductsSuccess) return;

    product.isFav = !product.isFav;

    emit(ProductsSuccess(List.from((state as ProductsSuccess).products)));
  }

  void toggleStar(ProductModel product) {
    if (state is! ProductsSuccess) return;

    product.isStar = !product.isStar;
    emit(ProductsSuccess(List.from((state as ProductsSuccess).products)));
  }
}
