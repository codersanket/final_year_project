import 'package:final_year_project/application/auth/auth/auth_bloc.dart';
import 'package:final_year_project/application/auth/login/login_cubit.dart';
import 'package:final_year_project/application/manufaturer/add_product/cubit/add_product_cubit.dart';
import 'package:final_year_project/domain/model/product_model.dart';
import 'package:final_year_project/locator.dart';
import 'package:final_year_project/presentation/pages/auth/login/login_page.dart';
import 'package:final_year_project/presentation/pages/customer/home/customer_home.dart';
import 'package:final_year_project/presentation/pages/customer/product_details/product_details.dart';
import 'package:final_year_project/presentation/pages/manufaturer/add_product/add_product_page.dart';
import 'package:final_year_project/presentation/pages/manufaturer/home/home.dart';
import 'package:final_year_project/presentation/pages/manufaturer/view_product/view_product.dart';
import 'package:final_year_project/presentation/pages/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Splash.routeName:
        return getPage(BlocProvider(
            create: (_) => getIt<AuthBloc>(), child: const Splash()));
      case LoginPage.routeName:
        return getPage(BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: LoginPage(),
        ));

      case ManHome.routeName:
        return getPage(const ManHome());
      case AddProductPage.route:
        return getPage(BlocProvider(
          create: (context) => getIt<AddProductCubit>(),
          child: AddProductPage(),
        ));
      case ViewProduct.route:
        return getPage(ViewProduct(
          productM: settings.arguments as ProductM,
        ));
      case CustomerHome.routeName:
        return getPage(CustomerHome());
      case ProductDetails.routeName:
        return getPage(ProductDetails(code: settings.arguments as String,));

      default:
        _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
              body: Center(
                child: Text("Something went Wrong"),
              ),
            ));
  }

  static MaterialPageRoute getPage(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}
