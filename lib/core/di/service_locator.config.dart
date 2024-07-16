// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/products/data/datasources/product_api_remote_data_source.dart'
    as _i4;
import '../../features/products/data/repositories/products_repository_impl.dart'
    as _i6;
import '../../features/products/domain/repositories/products_repository.dart'
    as _i5;
import '../../features/products/domain/usecases/get_products.dart' as _i7;
import '../../features/products/presentation/cubit/products_cubit.dart' as _i8;
import 'register_module.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i4.ProductApiRemoteImpl>(
        () => _i4.ProductApiRemoteImpl(gh<_i3.Dio>()));
    gh.singleton<_i5.IProductRepository>(
        () => _i6.ProductsRepositoryImpl(gh<_i4.ProductApiRemoteImpl>()));
    gh.factory<_i7.GetProducts>(
        () => _i7.GetProducts(gh<_i5.IProductRepository>()));
    gh.singleton<_i8.ProductsCubit>(
        () => _i8.ProductsCubit(gh<_i7.GetProducts>()));
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}
