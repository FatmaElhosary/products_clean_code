import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products_clean_code/core/di/service_locator.dart';
import 'package:products_clean_code/core/widgets/error_indicator.dart';
import 'package:products_clean_code/core/widgets/loading_indicator.dart';
import 'package:products_clean_code/core/widgets/search_bar_with_cart.dart';
import 'package:products_clean_code/features/products/presentation/cubit/products_cubit.dart';
import 'package:products_clean_code/features/products/presentation/cubit/products_states.dart';
import 'package:products_clean_code/features/products/presentation/widgets/product_item.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator.get<ProductsCubit>()..getProducts(),
      child: SafeArea(
        child: Scaffold(
          // padding: EdgeInsets.symmetric(horizontal: 17.w),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 17.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                Image.asset(
                  'assets/images/logo.png',
                  color: Theme.of(context).primaryColor,
                  height: 22.h,
                  width: 66.w,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 18.h),
                const SearchBarWithCart(),
                SizedBox(height: 16.h),
                Expanded(
                  child: BlocBuilder<ProductsCubit, ProductsState>(
                    builder: (context, state) {
                      if (state is GetProductsSuccess) {
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 2.5,
                            crossAxisSpacing: 16.w,
                            mainAxisSpacing: 16.h,
                          ),
                          itemBuilder: (_, index) => GestureDetector(
                            onTap: () {},
                            child: ProductItem(state.products[index]),
                          ),
                          itemCount: state.products.length,
                        );
                      } else if (state is GetProductsLoading) {
                        return const LoadingIndicator();
                      } else if (state is GetProductsError) {
                        return ErrorIndicator(state.errorMessage);
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
