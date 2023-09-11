import 'package:plaff_kebab/src/core/either_dart/either.dart';
import 'package:plaff_kebab/src/data/models/adress/adress_model.dart';
import 'package:plaff_kebab/src/domain/network/failure.dart';

abstract class AdressRepository {
  const AdressRepository();

  Future<Either<Failure, List<CustomerAddress>>> getAdresses();
}
