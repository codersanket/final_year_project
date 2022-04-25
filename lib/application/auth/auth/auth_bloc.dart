import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:final_year_project/domain/auth/iauth.dart';
import 'package:final_year_project/infrastructure/constants/storage_constants.dart';
import 'package:final_year_project/infrastructure/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required IAuth authRepo})
      : _authRepo = authRepo,
        super(AuthState.inital()) {
    on<AuthEvent>(_on);
    _userSubscription = _authRepo.getAuthStatus().listen((event) {
      add(AuthEvent.check(event));
    });
  }
  late IAuth _authRepo;

  User? _user;

  late StreamSubscription<User?> _userSubscription;

  _on(AuthEvent event, emit) async {
    await event.map(started: (_) {
      emit(state.copyWith(userStatus: UserStatus.intial));
    }, 
    check: (_) async {
      if (_.user != null) {
        _user = _.user;
        final response = await StorgaeConstants().users.doc(_user!.uid).get();
        final userType = getUserType(response["role"]);
        emit(state.copyWith(userStatus: UserStatus.logged, userType: userType));
      } else {
        emit(state.copyWith(userStatus: UserStatus.unlogged));
      }
    });
  }

  User? get user => _user;
  set user(User? user) => user = _user;

  UserType getUserType(int role) {
    switch (role) {
      case 0:
        return UserType.man;

      case 1:
        return UserType.ret;

      case 2:
        return UserType.cust;

      default:
        return UserType.man;
    }
  }
}
