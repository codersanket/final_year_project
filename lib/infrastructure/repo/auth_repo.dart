import 'package:dartz/dartz.dart';
import 'package:final_year_project/domain/auth/iauth.dart';
import 'package:final_year_project/domain/blockchain/connection.dart';
import 'package:final_year_project/infrastructure/constants/storage_constants.dart';
import 'package:final_year_project/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_year_project/infrastructure/failure/failure.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IAuth)
class AuthRepo extends IAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Stream<User?> getAuthStatus() async* {
    yield* _auth.userChanges();
  }

  BlockChain _blockChain = getIt<BlockChain>();

  StorgaeConstants _storgaeConstants = StorgaeConstants();

  @override
  Future<Either<User?, Failure>> loginUser(
      {required String email, required String password}) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (user.user != null) {
        return left(user.user!);
      }
      return left(null);
    } on FirebaseAuthException catch (e) {
      return right(Failure(errorCode: e.code, errorMessage: e.message!));
    }
  }

  @override
  Future<Either<User?, Failure>> registerUser(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    try {
      final response = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final uid = response.user!.uid;
      await _storgaeConstants.users
          .doc(uid)
          .set({"email": email, "name": name, "phone": phone, "role": 2});
      await _blockChain
          .submitQuery(function: "createCustomer", args: [uid, name, phone]);
      return left(null);
    } catch (e) {
      return right(
          Failure(errorCode: "12", errorMessage: "Something went Wrong"));
    }
  }
}
