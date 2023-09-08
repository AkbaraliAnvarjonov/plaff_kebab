class UserModel {
  final String id;
  final String name;
  final String phone;
  final bool isBlocked;
  final DateTime createdAt;
  final String fcmToken;
  final String tgChatId;
  final String dateOfBirth;
  final String registrationSource;
  final int minimalOrderPrice;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.isBlocked,
    required this.createdAt,
    required this.fcmToken,
    required this.tgChatId,
    required this.dateOfBirth,
    required this.registrationSource,
    required this.minimalOrderPrice,
  });

  factory UserModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('json must not be null');
    }

    return UserModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      isBlocked: json['is_blocked'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String? ?? ''),
      fcmToken: json['fcm_token'] as String? ?? '',
      tgChatId: json['tg_chat_id'] as String? ?? '',
      dateOfBirth: json['date_of_birth'] as String? ?? '',
      registrationSource: json['registration_source'] as String? ?? '',
      minimalOrderPrice: json['minimal_order_price'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'is_blocked': isBlocked,
      'created_at': createdAt.toIso8601String(),
      'fcm_token': fcmToken,
      'tg_chat_id': tgChatId,
      'date_of_birth': dateOfBirth,
      'registration_source': registrationSource,
      'minimal_order_price': minimalOrderPrice,
    };
  }
}
