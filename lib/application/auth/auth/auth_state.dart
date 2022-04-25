part of 'auth_bloc.dart';

enum UserStatus { intial, logged, unlogged, error }
enum UserType { intial, man, ret, cust }

@freezed
class AuthState with _$AuthState {
  const factory AuthState(
      {UserStatus? userStatus, required UserType userType}) = _AuthState;
  factory AuthState.inital() {
    return const AuthState(
        userStatus: UserStatus.intial, userType: UserType.intial);
  }
}
