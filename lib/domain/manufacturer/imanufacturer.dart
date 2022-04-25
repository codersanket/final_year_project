import 'package:dartz/dartz.dart';
import 'package:final_year_project/domain/model/product_model.dart';
import 'package:final_year_project/infrastructure/failure/failure.dart';

abstract class Imanufacturer {
  Future<Either<bool, Failure>> addProduct({required ProductM product});
}
