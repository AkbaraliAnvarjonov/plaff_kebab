import 'package:plaff_kebab/src/data/models/adress/location_model.dart';
import 'package:plaff_kebab/src/data/models/product/order_product.dart';

class Steps {
  String? id;
  String? branchName;
  LocationModel? location;
  String? address;
  String? destinationAddress;
  String? phoneNumber;
  List<OrdersProducts> products = [];
  String? description;
  String? orderNo;
  String? status;
  num? stepAmount;
  dynamic externalStepId;
  String? branchId;

  Steps({
    this.id,
    this.branchName,
    this.location,
    this.address,
    this.destinationAddress,
    this.phoneNumber,
    this.products = const [],
    this.description,
    this.orderNo,
    this.status,
    this.stepAmount,
    this.externalStepId,
    this.branchId,
  });

  Steps.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchName = json['branch_name'];
    location = json['location'] != null
        ? LocationModel.fromJson(json['location'])
        : null;
    address = json['address'];
    destinationAddress = json['destination_address'];
    phoneNumber = json['phone_number'];
    products = <OrdersProducts>[];
    if (json['products'] != null) {
      json['products'].forEach((v) {
        products.add(OrdersProducts.fromJson(v));
      });
    }
    description = json['description'];
    orderNo = json['order_no'];
    status = json['status'];
    stepAmount = json['step_amount'];
    externalStepId = json['external_step_id'];
    branchId = json['branch_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['branch_id'] = branchId;
    data['description'] = description;
    data['products'] = products.map((v) => v.toJson()).toList();
    return data;
  }
}
