part of 'utils.dart';

sealed class AppUtils {
  AppUtils._();

  static const kSpacer = Spacer();

  static const kGap = Gap(0);
  static const kGap4 = Gap(4);
  static const kGap6 = Gap(6);
  static const kGap8 = Gap(8);
  static const kGap12 = Gap(12);
  static const kGap16 = Gap(16);
  static const kGap20 = Gap(20);
  static const kGap24 = Gap(24);
  static const kGap40 = Gap(40);

  /// divider
  static const kDivider = Divider(height: 1);

  /// padding
  static const kPadding0 = EdgeInsets.zero;
  static const kPaddingAll6 = EdgeInsets.all(6);
  static const kPaddingAll8 = EdgeInsets.all(8);
  static const kPaddingAll12 = EdgeInsets.all(12);
  static const kPaddingAll16 = EdgeInsets.all(16);
  static const kPaddingAll24 = EdgeInsets.all(24);
  static const kPaddingHorizontal12 = EdgeInsets.symmetric(horizontal: 12);
  static const kPaddingHorizontal8 = EdgeInsets.symmetric(horizontal: 8);
  static const kPaddingHorizontal16 = EdgeInsets.symmetric(horizontal: 16);
  static const kPaddingHor32Ver20 =
      EdgeInsets.symmetric(horizontal: 32, vertical: 20);
  static const kPaddingBottom8Hor16top16 = EdgeInsets.fromLTRB(16, 16, 16, 8);
  static const kPaddingBottom16 = EdgeInsets.fromLTRB(0, 0, 0, 16);
  static const kPaddingBottom16left8 = EdgeInsets.fromLTRB(8, 0, 0, 16);
  static const kPaddingBottom2 = EdgeInsets.fromLTRB(0, 0, 0, 2);
  static const kPaddingBottom8 = EdgeInsets.fromLTRB(0, 0, 0, 8);
  static const kPaddingHor14Ver16 =
      EdgeInsets.symmetric(horizontal: 14, vertical: 16);
  static const kPaddingHor16Ver12 =
      EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  static const kPaddingHor16Ver24 =
      EdgeInsets.symmetric(horizontal: 16, vertical: 24);
  static const kPaddingHor16Ver10 =
      EdgeInsets.symmetric(horizontal: 16, vertical: 10);
  static const kPaddingVer16 = EdgeInsets.symmetric(vertical: 16);
  static const kPaddingVer8 = EdgeInsets.symmetric(vertical: 8);
  static const kPaddingBanner = EdgeInsets.only(top: 16, bottom: 8);
  static const kPaddingSearch =
      EdgeInsets.only(left: 16, top: 12, bottom: 12, right: 4);
  static const kPaddingSearchWidget =
      EdgeInsets.only(left: 16, bottom: 8, right: 16);

  static const kPaddingAllB16 = EdgeInsets.fromLTRB(16, 16, 16, 0);

  /// border radius
  static const kRadius = Radius.zero;
  static const kBorderRadius2 = BorderRadius.all(Radius.circular(2));
  static const kBorderRadius4 = BorderRadius.all(Radius.circular(4));
  static const kBorderRadius8 = BorderRadius.all(Radius.circular(8));
  static const kBorderRadius10 = BorderRadius.all(Radius.circular(10));
  static const kBorderRadius12 = BorderRadius.all(Radius.circular(12));
  static const kBorderRadius16 = BorderRadius.all(Radius.circular(16));
  static const kShapeRoundedNone = RoundedRectangleBorder();
  static const kShapeRoundedAll12 = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(12),
    ),
  );
  static const kShapeRoundedAll10 = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );
  static const kShapeRoundedBottom12 = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(12),
      bottomLeft: Radius.circular(12),
    ),
  );
}
