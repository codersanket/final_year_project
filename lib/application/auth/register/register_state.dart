part of 'register_cubit.dart';

enum RegisterStateStatus { intial, loading, loaded, failure }

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState.initial() =>
      const RegisterState(registerStateStatus: RegisterStateStatus.intial);

  const factory RegisterState(
      {String? name,
      String? email,
      String? password,
      String? phone,
      required RegisterStateStatus registerStateStatus}) = _RegisterState;
}
