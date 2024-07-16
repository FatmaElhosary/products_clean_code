import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:products_clean_code/core/constants.dart';
import 'package:products_clean_code/core/error/exception.dart';
import 'package:products_clean_code/features/products/data/datasources/product_remote_data_source.dart';
import 'package:products_clean_code/features/products/data/models/products.dart';

@lazySingleton
@Injectable(as: IProductRemoteDataSource)
class ProductApiRemoteImpl implements IProductRemoteDataSource {
  final Dio _dio;

  ProductApiRemoteImpl(
    this._dio,
  );

  @override
  Future<ProductsResponseDto> getProducts() async {
    try {
      final res = await _dio.get(APIConstants.productsEndPoint);
      return ProductsResponseDto.fromJson(res.data);
    } catch (e) {
     
      throw const RemoteException('failed to get products');
    }
  }
}
