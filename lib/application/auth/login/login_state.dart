part of 'login_cubit.dart';

enum LoginStateStatus { intial, loading, loaded, failure }

@freezed
class LoginState with _$LoginState {
  factory LoginState.initial() =>
      const LoginState(loginStateStatus: LoginStateStatus.intial);

  const factory LoginState(
      {String? email,
      String? password,
      required LoginStateStatus loginStateStatus}) = _LoginState;
}
