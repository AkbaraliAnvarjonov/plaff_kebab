import 'package:plaff_kebab/src/data/models/translations_model.dart';

class Option {
  final String id;
  final Translations title;

  Option({
    required this.id,
    required this.title,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'] ?? '',
      title: Translations.fromJson(json['title'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title.toJson(),
    };
  }
}
