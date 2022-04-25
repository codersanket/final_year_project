import 'package:bloc/bloc.dart';
import 'package:final_year_project/domain/manufacturer/imanufacturer.dart';
import 'package:final_year_project/domain/model/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

part 'add_product_state.dart';
part 'add_product_cubit.freezed.dart';

@injectable
class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required Imanufacturer man})
      : manuFacture = man,
        super(AddProductState.initial());

  late Imanufacturer manuFacture;

  void getBrand(String brand) {
    emit(state.copyWith(brand: brand));
  }

  void getModel(String model) {
    emit(state.copyWith(model: model));
  }

  void getDescription(String description) {
    emit(state.copyWith(description: description));
  }

  bool get validate =>
      (state.brand.isNotNullOrEmpty) &&
      (state.description.isNotNullOrEmpty) &&
      (state.model.isNotNullOrEmpty);

  void addProduct() async {
    emit(state.copyWith(status: AddProductStateStatus.isLoading));
    final response = await manuFacture.addProduct(
        product: ProductM(
            id: const Uuid().v4(),
            brand: state.brand,
            model: state.model,
            description: state.description,
            timeStamp: DateTime.now().toString(),
            name: FirebaseAuth.instance.currentUser!.uid,
            location: "Solapur"));
    response.fold(
        (l) => (emit(state.copyWith(status: AddProductStateStatus.sucess))),
        (r) => (emit(state.copyWith(status: AddProductStateStatus.failure))));
  }
}
