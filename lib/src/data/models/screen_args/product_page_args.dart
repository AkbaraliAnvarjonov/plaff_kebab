import 'package:plaff_kebab/src/data/models/category/description_model.dart';

class ProductArgs {
  final String image;
  final Description title;
  final Description description;
  const ProductArgs({
    required this.image,
    required this.description,
    required this.title,
  });
}
