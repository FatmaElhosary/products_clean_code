import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:products_clean_code/features/products/domain/usecases/get_products.dart';
import 'package:products_clean_code/features/products/presentation/cubit/products_states.dart';

@singleton
class ProductsCubit extends Cubit<ProductsState> {

  ProductsCubit( this._getProducts) : super(GetProductsInitial());
  final GetProducts _getProducts;

  Future<void> getProducts() async {
    emit(GetProductsLoading());
    final result = await _getProducts();
    result.fold((failure)=>emit(GetProductsError(failure.message)),
     (products)=>emit(GetProductsSuccess(products)));
  }
}
