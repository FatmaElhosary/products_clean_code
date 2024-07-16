import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products_clean_code/core/app_bloc_observer.dart';
import 'package:products_clean_code/core/di/service_locator.dart';
import 'package:products_clean_code/core/theming/theme_manager.dart';
import 'package:products_clean_code/features/products/presentation/pages/products_tab.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await configureDependencies();
  Bloc.observer = AppBlocObserver();
  runApp(const ProductsApp());
}

class ProductsApp extends StatelessWidget {
  const ProductsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      child: MaterialApp(
      
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeManager.mainTheme,
        home: const ProductsTab(),
      ),
    );
  }
}
