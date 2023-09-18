import 'package:plaff_kebab/src/core/either_dart/either.dart';
import 'package:plaff_kebab/src/data/models/on_demand/on_demand_model.dart';
import 'package:plaff_kebab/src/domain/network/failure.dart';

abstract class OnDemandRepository {
  const OnDemandRepository();

  Future<Either<Failure, String>> onDemandOrder(
      OnDemandModel onDemandModel);
}
