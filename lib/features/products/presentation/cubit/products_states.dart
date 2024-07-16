// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../domain/entities/product.dart';

abstract class ProductsState {}

class GetProductsInitial extends ProductsState {}

class GetProductsLoading extends ProductsState {}

class GetProductsSuccess extends ProductsState {
  List<Product> products;
  GetProductsSuccess(
     this.products,
  );
}

class GetProductsError extends ProductsState {
  final String errorMessage;
  GetProductsError(
    this.errorMessage,
  );
}
