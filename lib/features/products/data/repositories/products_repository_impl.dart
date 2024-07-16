import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:products_clean_code/core/error/exception.dart';
import 'package:products_clean_code/core/error/failure.dart';
import 'package:products_clean_code/features/products/data/datasources/product_api_remote_data_source.dart';
import 'package:products_clean_code/features/products/domain/entities/product.dart';
import 'package:products_clean_code/features/products/domain/repositories/products_repository.dart';

@Singleton(as: IProductRepository)
class ProductsRepositoryImpl implements IProductRepository {
  final ProductApiRemoteImpl _remoteDataSource;

  ProductsRepositoryImpl(
    this._remoteDataSource,
  );
  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final res = await _remoteDataSource.getProducts();
      print(res.products);
      return Right(res.products);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}
