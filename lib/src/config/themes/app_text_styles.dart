part of 'themes.dart';

class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {
  const ThemeTextStyles({
    required this.subHead14Weight400,
    required this.appBarTitle,
    required this.buttonStyle,
    required this.regularCaption1,
    required this.regularFootnote,
    required this.regularSubheadline,
    required this.regularCallout,
    required this.regularBody,
    required this.regularHeadline,
    required this.regularTitle1,
    required this.subheadline,
    required this.counterStyle,
    required this.bodyTitle3,
    required this.smallLink,
    required this.style15Wight400,
  });
  final TextStyle subHead14Weight400;
  final TextStyle style15Wight400;
  final TextStyle appBarTitle;
  final TextStyle smallLink;
  final TextStyle buttonStyle;
  final TextStyle regularCaption1;
  final TextStyle regularFootnote;
  final TextStyle regularSubheadline;
  final TextStyle regularCallout;
  final TextStyle regularBody;
  final TextStyle regularHeadline;
  final TextStyle regularTitle1;
  final TextStyle subheadline;
  final TextStyle counterStyle;
  final TextStyle bodyTitle3;

  static const ThemeTextStyles light = ThemeTextStyles(
    appBarTitle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    style15Wight400: TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
    smallLink: TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    subHead14Weight400: TextStyle(
      color: Color(0xFF141414),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    buttonStyle: TextStyle(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
    regularBody: TextStyle(
      color: Colors.black,
      fontSize: 17,
      fontWeight: FontWeight.w400,
    ),
    regularCallout: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    regularCaption1: TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    regularFootnote: TextStyle(
      color: Colors.black,
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
    regularHeadline: TextStyle(
      color: Colors.black,
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
    regularSubheadline: TextStyle(
      color: Color(0xFF2B2A28),
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
    regularTitle1: TextStyle(
      color: Colors.black,
      fontSize: 28,
      fontWeight: FontWeight.w600,
    ),
    counterStyle: TextStyle(
      color: Colors.black,
      fontSize: 17,
      fontWeight: FontWeight.w500,
    ),
    subheadline: TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
    bodyTitle3: TextStyle(
      color: Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.w400,
    ),
  );
  static const ThemeTextStyles dark = ThemeTextStyles(
    smallLink: TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    style15Wight400: TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
    subHead14Weight400: TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    appBarTitle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    buttonStyle: TextStyle(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
    regularBody: TextStyle(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.w400,
    ),
    regularCallout: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    regularCaption1: TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    regularFootnote: TextStyle(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
    regularHeadline: TextStyle(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
    regularSubheadline: TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
    regularTitle1: TextStyle(
      color: Colors.white,
      fontSize: 34,
      fontWeight: FontWeight.w400,
    ),
    counterStyle: TextStyle(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.w400,
    ),
    subheadline: TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
    bodyTitle3: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w400,
    ),
  );

  @override
  ThemeExtension<ThemeTextStyles> copyWith({
    TextStyle? appBarTitle,
    TextStyle? buttonStyle,
    TextStyle? regularBody,
    TextStyle? regularCallout,
    TextStyle? regularCaption1,
    TextStyle? regularFootnote,
    TextStyle? regularHeadline,
    TextStyle? regularSubheadline,
    TextStyle? regularTitle1,
    TextStyle? counterStyle,
    TextStyle? bodyFootnote,
    TextStyle? subheadline,
    TextStyle? bodyTitle3,
    TextStyle? subHead14Weight400,
    TextStyle? smallLink,
    TextStyle? style15Wight400,
  }) =>
      ThemeTextStyles(
        subHead14Weight400: subHead14Weight400 ?? this.subHead14Weight400,
        style15Wight400: style15Wight400 ?? this.style15Wight400,
        appBarTitle: appBarTitle ?? this.appBarTitle,
        smallLink: smallLink ?? this.appBarTitle,
        buttonStyle: buttonStyle ?? this.buttonStyle,
        regularBody: regularBody ?? this.regularBody,
        regularCallout: regularCallout ?? this.regularCallout,
        regularCaption1: regularCaption1 ?? this.regularCaption1,
        regularFootnote: regularFootnote ?? this.regularFootnote,
        regularHeadline: regularHeadline ?? this.regularHeadline,
        regularSubheadline: regularSubheadline ?? this.regularSubheadline,
        regularTitle1: regularTitle1 ?? this.regularTitle1,
        counterStyle: counterStyle ?? this.counterStyle,
        subheadline: subheadline ?? this.subheadline,
        bodyTitle3: bodyTitle3 ?? this.bodyTitle3,
      );

  @override
  ThemeExtension<ThemeTextStyles> lerp(
      ThemeExtension<ThemeTextStyles>? other, double t) {
    if (other is! ThemeTextStyles) {
      return this;
    }
    return ThemeTextStyles(
      subHead14Weight400:
          TextStyle.lerp(subHead14Weight400, other.subHead14Weight400, t)!,
      appBarTitle: TextStyle.lerp(appBarTitle, other.appBarTitle, t)!,
      style15Wight400:
          TextStyle.lerp(style15Wight400, other.style15Wight400, t)!,
      buttonStyle: TextStyle.lerp(buttonStyle, other.buttonStyle, t)!,
      smallLink: TextStyle.lerp(smallLink, other.buttonStyle, t)!,
      regularBody: TextStyle.lerp(regularBody, other.regularBody, t)!,
      regularCallout: TextStyle.lerp(regularCallout, other.regularCallout, t)!,
      regularCaption1:
          TextStyle.lerp(regularCaption1, other.regularCaption1, t)!,
      regularFootnote:
          TextStyle.lerp(regularFootnote, other.regularFootnote, t)!,
      regularHeadline:
          TextStyle.lerp(regularHeadline, other.regularHeadline, t)!,
      regularSubheadline:
          TextStyle.lerp(regularSubheadline, other.regularSubheadline, t)!,
      regularTitle1: TextStyle.lerp(regularTitle1, other.regularTitle1, t)!,
      counterStyle: TextStyle.lerp(counterStyle, other.counterStyle, t)!,
      subheadline: TextStyle.lerp(subheadline, other.subheadline, t)!,
      bodyTitle3: TextStyle.lerp(bodyTitle3, other.bodyTitle3, t)!,
    );
  }
}
