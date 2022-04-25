part of 'add_product_cubit.dart';
enum AddProductStateStatus{intial,isLoading,sucess,failure}
@freezed
class AddProductState with _$AddProductState {
  factory AddProductState.initial() {
    return AddProductState(
      status: AddProductStateStatus.intial
    );
  }

  factory AddProductState(
      {String? brand,
      String? model,
      String? description,
      AddProductStateStatus? status}) = _AddProductState;
}
