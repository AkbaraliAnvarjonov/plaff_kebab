class PropertyOption {
  final String propertyId;
  final String optionId;

  PropertyOption({
    required this.propertyId,
    required this.optionId,
  });

  factory PropertyOption.fromJson(Map<String, dynamic> json) {
    return PropertyOption(
      propertyId: json['property_id'] ?? '',
      optionId: json['option_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'property_id': propertyId,
      'option_id': optionId,
    };
  }
}
