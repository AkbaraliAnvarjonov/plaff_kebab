part of 'extension.dart';

extension StringToIntParsing on String {
  int? toIntOrNull() {
    int? result;
    try {
      result = int.parse(this);
    } catch (e) {
      result = null;
    }
    return result;
  }

  int toIntOrDefault(int defaultValue) {
    return toIntOrNull() ?? defaultValue;
  }
}
