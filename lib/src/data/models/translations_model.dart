class Translations {
  final String uz;
  final String ru;
  final String en;

  Translations({
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

  factory Translations.fromJson(Map<String, dynamic> json) {
    return Translations(
      uz: json['uz'] ?? '',
      ru: json['ru'] ?? '',
      en: json['en'] ?? '',
    );
  }
  Translations copyWith({
    String? uz,
    String? ru,
    String? en,
  }) =>
      Translations(
        uz: uz ?? this.uz,
        ru: ru ?? this.ru,
        en: en ?? this.en,
      );
}
