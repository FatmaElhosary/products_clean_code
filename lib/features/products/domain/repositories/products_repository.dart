import 'package:dartz/dartz.dart';
import 'package:products_clean_code/core/error/failure.dart';
import 'package:products_clean_code/features/products/domain/entities/product.dart';

abstract class IProductRepository {
 Future<Either<Failure, List<Product>>> getProducts();
}
