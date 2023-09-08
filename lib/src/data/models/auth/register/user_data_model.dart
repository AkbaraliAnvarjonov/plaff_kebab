class UserData {
  final String id;
  final String name;
  final String phone;
  final bool isBlocked;
  final DateTime createdAt;
  final String accessToken;
  final String refreshToken;
  final int minimalOrderPrice;

  UserData({
    required this.id,
    required this.name,
    required this.phone,
    required this.isBlocked,
    required this.createdAt,
    required this.accessToken,
    required this.refreshToken,
    required this.minimalOrderPrice,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      isBlocked: json['is_blocked'] ?? false,
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      accessToken: json['access_token'] ?? '',
      refreshToken: json['refresh_token'] ?? '',
      minimalOrderPrice: json['minimal_order_price'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'is_blocked': isBlocked,
      'created_at': createdAt.toIso8601String(),
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'minimal_order_price': minimalOrderPrice,
    };
  }
}
