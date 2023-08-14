import 'package:plaff_kebab/src/core/either_dart/either.dart';
import 'package:plaff_kebab/src/data/models/banner/banner_model.dart';
import 'package:plaff_kebab/src/domain/network/failure.dart';

abstract class BannerRepository {
  const BannerRepository();

  Future<Either<Failure, List<BannerModel>>> getBanners();
}
