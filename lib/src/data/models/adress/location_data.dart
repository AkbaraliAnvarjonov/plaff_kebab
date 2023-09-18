class LocationData {
  final String branchId;
  final double latitude;
  final double longitude;
  final int orderPrice;

  LocationData({
    required this.branchId,
    required this.latitude,
    required this.longitude,
    required this.orderPrice,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) {
    return LocationData(
      branchId: json['branch_id'] as String? ?? "",
      latitude: json['lat'] as double? ?? 0,
      longitude: json['long'] as double? ?? 0,
      orderPrice: json['order_price'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'branch_id': branchId,
      'lat': latitude,
      'long': longitude,
      'order_price': orderPrice,
    };
  }
}
