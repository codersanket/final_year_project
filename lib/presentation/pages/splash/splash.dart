import 'dart:async';

import 'package:final_year_project/application/auth/auth/auth_bloc.dart';
import 'package:final_year_project/presentation/pages/auth/login/login_page.dart';
import 'package:final_year_project/presentation/pages/customer/home/customer_home.dart';
import 'package:final_year_project/presentation/pages/manufaturer/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  static const String routeName = '/splash';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          previous.userStatus != current.userStatus,
      listener: (context, state) {
        if (state.userStatus == UserStatus.logged) {
          switch (state.userType) {
            case UserType.cust:
              Navigator.pushNamed(context, CustomerHome.routeName);
              break;
            case UserType.man:
              Navigator.pushNamed(context, ManHome.routeName);
              break;
            default:
              Navigator.pushNamed(context, ManHome.routeName);
          }
        } else if (state.userStatus == UserStatus.unlogged) {
          Navigator.pushNamed(context, LoginPage.routeName);
        }
      },
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: const Scaffold(
          body: Center(
            child: Text("This is Splash Page"),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
