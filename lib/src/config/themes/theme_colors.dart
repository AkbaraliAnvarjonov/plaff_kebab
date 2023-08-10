part of 'themes.dart';

/// A set of colors for the entire app.
const colorLightScheme = ColorScheme.light(
  primary: Color(0xFFFFCC00),
  surface: Color(0xFFF7F9FC),
  onSurface: Color(0xFF020000),
  secondary: Color(0xFF69D7C7),
  onSecondary: Color(0xFF020000),
  error: Color(0xFFD93F2F),
  background: Color(0xFFF7F5F6),
  onBackground: Color(0xFF020000),
);

///
const colorDarkScheme = ColorScheme.dark(
  primary: Color(0xFFFFCC00),
  surface: Color(0xFFF7F9FC),
  secondary: Color(0xFF69D7C7),
  error: Color(0xFFD93F2F),
  background: Color(0xFFF7F5F6),
  onBackground: Color(0xFF020000),
);

class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    required this.cardColor,
    required this.listileColor,
  });

  final Color cardColor;
  final Color listileColor;

  static const ThemeColors light = ThemeColors(
    cardColor: Colors.white,
    listileColor: Color(0xFFF7F7F7),
  );
  static const ThemeColors dark = ThemeColors(
    cardColor: Color(0xFF1E1E1E),
    listileColor: Color(0xFFF7F7F7),
  );

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? cardColor,
    Color? listileColor,
  }) =>
      ThemeColors(
          cardColor: cardColor ?? this.cardColor,
          listileColor: listileColor ?? this.listileColor);

  @override
  ThemeExtension<ThemeColors> lerp(
      ThemeExtension<ThemeColors>? other, double t) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      listileColor: Color.lerp(listileColor, other.listileColor, t)!,
      cardColor: Color.lerp(cardColor, other.cardColor, t)!,
    );
  }
}
