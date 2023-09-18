class ShippingPrice {
  final int price;
  final double distance;

  ShippingPrice({
    required this.price,
    required this.distance,
  });

  factory ShippingPrice.fromJson(Map<String, dynamic> json) {
    return ShippingPrice(
      price: json['price'] as int? ?? 0,
      distance: json['distance'] as double? ?? 0,
    );
  }
}
