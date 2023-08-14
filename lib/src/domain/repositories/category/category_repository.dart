import 'package:plaff_kebab/src/core/either_dart/either.dart';
import 'package:plaff_kebab/src/data/models/category/category_with_products_model.dart';
import 'package:plaff_kebab/src/domain/network/failure.dart';

abstract class CategoryRepository {
  const CategoryRepository();

  Future<Either<Failure, List<CategoryWithProducts>>> getCategoryWithProducts();
}
