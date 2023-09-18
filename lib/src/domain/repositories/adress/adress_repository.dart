import 'package:geolocator/geolocator.dart';
import 'package:plaff_kebab/src/core/either_dart/either.dart';
import 'package:plaff_kebab/src/data/models/adress/adress_model.dart';
import 'package:plaff_kebab/src/data/models/adress/branch_model.dart';
import 'package:plaff_kebab/src/data/models/adress/location_data.dart';
import 'package:plaff_kebab/src/data/models/adress/shipping_price.dart';
import 'package:plaff_kebab/src/domain/network/failure.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

abstract class AdressRepository {
  const AdressRepository();

  Future<Either<Failure, List<CustomerAddress>>> getAdresses();
  Future<Either<Failure, Position>> getCurrentLocation();
  Future<Either<Failure, Position>> getLocationTitle();
  Future<Either<Failure, String>> postAdress(CustomerAddress address);
  Future<Either<Failure, ShippingPrice>> calculateShipping(
      LocationData locationData);
  Future<Either<Failure, List<Branch>>> getNearestBranches(Point point);
}
