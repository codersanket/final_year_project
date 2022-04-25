import 'dart:developer';

import 'package:final_year_project/application/auth/login/login_cubit.dart';
import 'package:final_year_project/presentation/pages/auth/signup/sign_up.dart';
import 'package:final_year_project/presentation/pages/auth/widgets/custom_button.dart';
import 'package:final_year_project/presentation/pages/auth/widgets/custom_textfield.dart';
import 'package:final_year_project/presentation/pages/auth/widgets/page_swap_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  static const routeName = '/login';
  ValueNotifier<bool> _isLogin = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _avilableHeight = _size.height - kToolbarHeight;
    return WillPopScope(
      onWillPop: () async => false,
      child: ValueListenableBuilder<bool>(
        valueListenable: _isLogin,
        builder: (context, snapshot, _) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: _isLogin.value
                ? SignUp(
                    valueNotifier: _isLogin,
                  )
                : BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      log(state.toString());
                      if (state.loginStateStatus == LoginStateStatus.failure) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                "Something went Wrong.Please recheck email and password")));
                      }
                    },
                    builder: (context, state) {
                      return Scaffold(
                        appBar: AppBar(
                          automaticallyImplyLeading: false,
                          title: const Text("Login"),
                        ),
                        body: SingleChildScrollView(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height -
                                kToolbarHeight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 64,
                                ),
                                CustomTextField(
                                  hint: "Email",
                                  onChanged: (val) =>
                                      context.read<LoginCubit>().getEmail(val),
                                ),
                                CustomTextField(
                                  hint: "Password",
                                  onChanged: (val) => context
                                      .read<LoginCubit>()
                                      .getPassword(val),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                CustomButtonRow(
                                  onTap: () =>
                                      context.read<LoginCubit>().login(),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                PageSwapButton(valueNotifier: _isLogin),
                                const SizedBox(
                                  height: 60,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
