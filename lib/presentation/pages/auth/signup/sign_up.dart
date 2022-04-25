import 'package:final_year_project/application/auth/login/login_cubit.dart';
import 'package:final_year_project/application/auth/register/register_cubit.dart';
import 'package:final_year_project/presentation/pages/auth/widgets/custom_button.dart';
import 'package:final_year_project/presentation/pages/auth/widgets/custom_textfield.dart';
import 'package:final_year_project/presentation/pages/auth/widgets/page_swap_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  const SignUp({
    Key? key,
    required this.valueNotifier,
  }) : super(key: key);
  static const route = '/signUp';
  final ValueNotifier<bool> valueNotifier;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state.registerStateStatus == RegisterStateStatus.failure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                  "Something went Wrong.Please recheck email and password")));
        }
        if (state.registerStateStatus == RegisterStateStatus.loading) {
          showDialog(
              context: context,
              builder: (_) => const Center(
                    child: CircularProgressIndicator(),
                  ));
        }
        if (state.registerStateStatus == RegisterStateStatus.loaded) {}
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () => valueNotifier.value = !valueNotifier.value,
            ),
            title: const Text("Register"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  hint: "Name",
                  onChanged: (val) =>
                      context.read<RegisterCubit>().getName(val),
                ),
                CustomTextField(
                  hint: "Email",
                  onChanged: (val) =>
                      context.read<RegisterCubit>().getEmail(val),
                ),
                CustomTextField(
                  hint: "Password",
                  onChanged: (val) =>
                      context.read<RegisterCubit>().getPassword(val),
                ),
                CustomTextField(
                  hint: "Phone Number",
                  onChanged: (val) =>
                      context.read<RegisterCubit>().getPhoneNumber(val),
                ),
                CustomButtonRow(
                  isLoginPage: false,
                  onTap: () => context.read<RegisterCubit>().register(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        "Already have a account?",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      PageSwapButton(valueNotifier: valueNotifier),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
