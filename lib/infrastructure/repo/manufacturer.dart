import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:final_year_project/domain/blockchain/connection.dart';
import 'package:final_year_project/domain/manufacturer/imanufacturer.dart';
import 'package:final_year_project/domain/model/product_model.dart';
import 'package:final_year_project/infrastructure/constants/storage_constants.dart';
import 'package:final_year_project/infrastructure/failure/failure.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Imanufacturer)
class Manufacturer extends Imanufacturer {
  Manufacturer({required BlockChain chain})
      : _chain = chain,
        super();
  late BlockChain _chain;
  final StorgaeConstants _storge = StorgaeConstants();
  @override
  Future<Either<bool, Failure>> addProduct({required ProductM product}) async {
    try {
      await _chain.submitQuery(function: 'createCode', args: [
        product.id,
        product.brand,
        product.model,
        BigInt.from(0),
        product.description,
        product.name,
        product.location,
        product.timeStamp
      ]);
      await _storge.productsStorage.add(product.toJson());

      return left(true);
    } on FirebaseException catch (e) {
      return right(Failure(errorCode: e.code, errorMessage: e.message));
    } catch (e) {
      return right(
          Failure(errorCode: "12", errorMessage: "Something went Wrong"));
    }
  }
}
