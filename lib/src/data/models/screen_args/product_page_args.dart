import 'package:plaff_kebab/src/data/models/translations_model.dart';

class ProductArgs {
  final String image;
  final Translations title;
  final Translations description;
  const ProductArgs({
    required this.image,
    required this.description,
    required this.title,
  });
}
