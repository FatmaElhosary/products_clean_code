import 'package:products_clean_code/features/products/data/models/products.dart';

abstract class IProductRemoteDataSource {
  Future<ProductsResponseDto> getProducts();
}
