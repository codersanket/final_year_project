import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:final_year_project/domain/auth/iauth.dart';
import 'package:final_year_project/infrastructure/repo/auth_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required IAuth auth})
      : _auth = auth,
        super(RegisterState.initial());
  final IAuth _auth;
  void getEmail(String val) {
    emit(state.copyWith(
        email: val, registerStateStatus: RegisterStateStatus.intial));
  }

  void getPassword(String val) {
    emit(state.copyWith(
        password: val, registerStateStatus: RegisterStateStatus.intial));
  }

  void getName(String val) {
    emit(state.copyWith(
        name: val, registerStateStatus: RegisterStateStatus.intial));
  }

  void getPhoneNumber(String val) {
    emit(state.copyWith(
        phone: val, registerStateStatus: RegisterStateStatus.intial));
  }

  void register() async {
    if (state.email!.isNotEmpty &&
        state.password!.isNotEmpty &&
        state.phone!.isNotEmpty &&
        state.name!.isNotEmpty) {
      emit(state.copyWith(registerStateStatus: RegisterStateStatus.loading));
      final response = await _auth.registerUser(
          name: state.name!,
          email: state.email!,
          password: state.password!,
          phone: state.phone!);
      response.fold(
          (l) => emit(
              state.copyWith(registerStateStatus: RegisterStateStatus.loaded)),
          (r) => emit(state.copyWith(
              registerStateStatus: RegisterStateStatus.failure)));
    }
  }
}
