import 'package:bloc/bloc.dart';
import 'package:final_year_project/domain/auth/iauth.dart';
import 'package:final_year_project/infrastructure/repo/auth_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required IAuth authRepo})
      : _auth = authRepo,
        super(LoginState.initial());
  final IAuth _auth;

  void getEmail(String val) {
    emit(state.copyWith(email: val, loginStateStatus: LoginStateStatus.intial));
  }

  void getPassword(String val) {
    emit(state.copyWith(
        password: val, loginStateStatus: LoginStateStatus.intial));
  }

  void login() async {
    emit(state.copyWith(loginStateStatus: LoginStateStatus.loading));
    final response =
        await _auth.loginUser(email: state.email!, password: state.password!);
    response.fold(
        (l) => emit(state.copyWith(loginStateStatus: LoginStateStatus.loaded)),
        (r) =>
            emit(state.copyWith(loginStateStatus: LoginStateStatus.failure)));
  }
}
