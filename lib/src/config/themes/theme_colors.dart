part of 'themes.dart';

/// A set of colors for the entire app.
const colorLightScheme = ColorScheme.light(
  primary: Color(0xFFFFCC00),
  surface: Color(0xFFF7F9FC),
  onSurface: Color(0xFFF5F5F5),
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
    required this.black5,
    required this.black3,
    required this.black,
  });

  final Color cardColor;
  final Color black;
  final Color listileColor;
  final Color black5;
  final Color black3;

  static const ThemeColors light = ThemeColors(
    cardColor: Colors.white,
    black: Colors.black,
    listileColor: Color(0xFFF7F7F7),
    black5: Color(0xFF9AA6AC),
    black3: Color(0xFF858585),
  );
  static const ThemeColors dark = ThemeColors(
    cardColor: Color(0xFF1E1E1E),
    black: Colors.black,
    listileColor: Color(0xFFF7F7F7),
    black5: Color(0xFF9AA6AC),
    black3: Color(0xFF858585),
  );

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? cardColor,
    Color? listileColor,
    Color? black5,
    Color? black3,
    Color? black,
  }) =>
      ThemeColors(
        cardColor: cardColor ?? this.cardColor,
        listileColor: listileColor ?? this.listileColor,
        black5: black5 ?? this.black5,
        black3: black3 ?? this.black3,
        black: black ?? this.black,
      );

  @override
  ThemeExtension<ThemeColors> lerp(
      ThemeExtension<ThemeColors>? other, double t) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      listileColor: Color.lerp(listileColor, other.listileColor, t)!,
      cardColor: Color.lerp(cardColor, other.cardColor, t)!,
      black5: Color.lerp(black5, other.black5, t)!,
      black3: Color.lerp(black3, other.black3, t)!,
      black: Color.lerp(black, other.black, t)!,
    );
  }
}
