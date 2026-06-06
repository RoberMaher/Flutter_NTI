import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi_nti/cart/models/product_model.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  GetAllProducts() async {
    emit(ProductsLoading());
    try {
      final dio = Dio();
      final response = await dio.get('https://dummyjson.com/products');
      Map<String, dynamic> productsData = response.data as Map<String, dynamic>;
      List<ProductModel> productsList = productsData['products']
          .map<ProductModel>((product) => ProductModel.fromJson(product))
          .toList();
      emit(ProductsSuccess(productsList));
    } on DioException catch (e) {
      emit(ProductsFailure(e.toString()));
    }
  }
}
