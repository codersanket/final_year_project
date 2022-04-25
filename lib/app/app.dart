import 'package:final_year_project/application/auth/register/register_cubit.dart';
import 'package:final_year_project/locator.dart';
import 'package:final_year_project/presentation/pages/splash/splash.dart';
import 'package:final_year_project/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Splash.routeName,
        onGenerateRoute: Routes.onGenerateRoute,
      ),
    );
  }
}
