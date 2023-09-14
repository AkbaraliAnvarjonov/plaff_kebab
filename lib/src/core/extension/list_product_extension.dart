import 'package:plaff_kebab/src/data/source/hive/product.dart';

extension ProductsListTotalPrice on List<Products> {
  double calculateTotalPrice() {
    return fold<double>(0, (total, product) {
      final productPrice = product.price * product.quantity;

      return total + (productPrice);
    });
  }
}
