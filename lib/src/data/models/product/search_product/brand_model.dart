class Brand {
  String id;
  String slug;
  // Other fields...

  Brand({
    required this.id,
    required this.slug,
    // Other fields...
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'] ?? '',
      slug: json['slug'] ?? '',
      // Other fields...
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      // Other fields...
    };
  }

  Brand copyWith({
    String? id,
    String? slug,
    // Other fields...
  }) {
    return Brand(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      // Other fields...
    );
  }
}
