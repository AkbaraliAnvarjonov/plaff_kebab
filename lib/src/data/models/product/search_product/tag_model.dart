class Tag {
  String id;
  String slug;
  // Other fields...

  Tag({
    required this.id,
    required this.slug,
    // Other fields...
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
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

  Tag copyWith({
    String? id,
    String? slug,
    // Other fields...
  }) {
    return Tag(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      // Other fields...
    );
  }
}
