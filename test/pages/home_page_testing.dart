import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plaff_kebab/main.dart';

void main() {
  group(
    'CalculatorApp',
    () {
      testWidgets(
        'Render 4 widgets of Type ListTile',
        (tester) async {
          await tester.pumpWidget(const MainApp());
          expect(
            find.byKey(const Key('initial')),
            findsNWidgets(1),
          ); // Expecting 4 ListTile widget on    Screen.
        },
      );
    },
  );
}
