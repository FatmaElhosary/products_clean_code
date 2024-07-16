// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:products_clean_code/core/error/failure.dart';
import 'package:products_clean_code/features/products/domain/entities/product.dart';
import 'package:products_clean_code/features/products/domain/repositories/products_repository.dart';


@injectable
class GetProducts {
  final IProductRepository _repository;

  GetProducts(
    this._repository,
  );
  Future<Either<Failure, List<Product>>> call() => _repository.getProducts();
}
