import 'package:plaff_kebab/src/core/either_dart/either.dart';
import 'package:plaff_kebab/src/data/models/product/product_model.dart';
import 'package:plaff_kebab/src/data/models/product/search_product/search_product.dart';
import 'package:plaff_kebab/src/domain/network/failure.dart';

abstract class ProductRepository {
  const ProductRepository();
  Future<Either<Failure, ProductIdModel>> getProductwithId(
      {required String id});
  Future<Either<Failure, List<SearchProduct>>> getSearchProduct(
      {required String search});
}
