import 'package:final_year_project/application/manufaturer/add_product/cubit/add_product_cubit.dart';
import 'package:final_year_project/presentation/pages/manufaturer/add_product/widgets/custom_textfiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({Key? key}) : super(key: key);
  static const route = '/addProduct';

  TextEditingController _brand = TextEditingController();
  TextEditingController _model = TextEditingController();
  TextEditingController _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state.status == AddProductStateStatus.isLoading) {
          showDialog(
              context: context,
              builder: (_) => const Center(
                    child: CircularProgressIndicator(),
                  ));
        }
        if (state.status == AddProductStateStatus.failure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Something went Wrong")));
        }
        if (state.status == AddProductStateStatus.sucess) {
          Navigator.pop(context);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Add Product"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomTextField(
                    hint: "Brand",
                    onChanged: (val) =>
                        context.read<AddProductCubit>().getBrand(val),
                    controller: _brand,
                  ),
                  CustomTextField(
                    hint: "Model",
                    onChanged: (val) =>
                        context.read<AddProductCubit>().getModel(val),
                    controller: _model,
                  ),
                  CustomTextField(
                    hint: "Description",
                    isParagarph: true,
                    onChanged: (val) =>
                        context.read<AddProductCubit>().getDescription(val),
                    controller: _description,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    disabledColor: Colors.grey,
                    onPressed: !context.read<AddProductCubit>().validate
                        ? null
                        : () {
                            context.read<AddProductCubit>().addProduct();
                          },
                    child: const Text(
                      "Add Product",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
