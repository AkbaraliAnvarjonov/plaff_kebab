import 'package:plaff_kebab/src/core/either_dart/either.dart';
import 'package:plaff_kebab/src/data/models/product/history_order/history_order.dart';
import 'package:plaff_kebab/src/domain/network/failure.dart';

abstract class OrderRepository {
  const OrderRepository();
  Future<Either<Failure, List<Orders>>> getProductwithId();
}
