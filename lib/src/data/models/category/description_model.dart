class Description {
  final String uz;
  final String ru;
  final String en;

  Description({
    required this.uz,
    required this.ru,
    required this.en,
  });
  Map<String, dynamic> toJson() {
    return {
      'uz': uz,
      'ru': ru,
      'en': en,
    };
  }

  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(
      uz: json['uz'] ?? '',
      ru: json['ru'] ?? '',
      en: json['en'] ?? '',
    );
  }
  Description copyWith({
    String? uz,
    String? ru,
    String? en,
  }) =>
      Description(
        uz: uz ?? this.uz,
        ru: ru ?? this.ru,
        en: en ?? this.en,
      );
}
