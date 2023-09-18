import 'package:plaff_kebab/src/data/models/on_demand/on_demand_order_products.dart';

class StepModel {
  final String branchId;
  final String description;
  final List<OrdersProductsOndemand> products;

  StepModel({
    required this.branchId,
    required this.description,
    required this.products,
  });

  Map<String, dynamic> toJson() {
    return {
      'branch_id': branchId,
      'description': description,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }
}
