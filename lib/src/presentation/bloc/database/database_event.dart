import 'package:plaff_kebab/src/data/models/product/combo/combo_model.dart';
import 'package:plaff_kebab/src/data/models/product/modifier/modifier.dart';
import 'package:plaff_kebab/src/data/models/product/product_model.dart';
import 'package:plaff_kebab/src/data/source/hive/product.dart';

abstract class DatabaseEvent {}

class AddProduct extends DatabaseEvent {
  final ProductIdModel product;
  final List<Combo> combo;
  final List<Modifier> modifier;

  AddProduct({
    required this.combo,
    required this.modifier,
    required this.product,
  });
}

class DeleteProducts extends DatabaseEvent {
  DeleteProducts();
}

class GetProduct extends DatabaseEvent {}

class UpdateProduct extends DatabaseEvent {
  bool? isMinus;
  bool? isDelete;
  final Products product;

  UpdateProduct(this.product, {this.isDelete, this.isMinus});
}
