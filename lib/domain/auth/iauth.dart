import 'package:dartz/dartz.dart';
import 'package:final_year_project/infrastructure/failure/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuth {
  Future<Either<User?, Failure>> loginUser({required String email,required String password});
  Future<Either<User?, Failure>> registerUser({required String email,required String password,required String name,required String phone});
  Stream<User?> getAuthStatus();
}
