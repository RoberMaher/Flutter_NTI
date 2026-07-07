// fav/cubit/fav_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:marketi_nti/home/models/product_model.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());

  final List<ProductModel> favItems = [];

  void addToFav(ProductModel product) {
    try {
      emit(FavLoading());

      if (!favItems.any((item) => item.id == product.id)) {
        favItems.add(product);
      }

      emit(FavSuccess());
    } catch (e) {
      emit(FavFailure(errorMessage: e.toString()));
    }
  }

  void removeFromFav(ProductModel product) {
    try {
      emit(FavLoading());

      favItems.removeWhere((item) => item.id == product.id);

      emit(FavSuccess());
    } catch (e) {
      emit(FavFailure(errorMessage: e.toString()));
    }
  }

  void toggleFav(ProductModel product) {
    final exists = favItems.any((item) => item.id == product.id);

    if (exists) {
      favItems.removeWhere((item) => item.id == product.id);
      product.isFav = false;
    } else {
      favItems.add(product);
      product.isFav = true;
    }

    emit(FavSuccess());
  }
}
