import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rounded_scroll/rounded_scroll.dart';

void main() {
  testWidgets("Test RoundedScroll Widget", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Material(
          child: Scaffold(
            body: RoundedScroll(
              children: [Text("HelloWorld")],
            ),
          ),
        ),
      ),
    );

    await tester.pump();

    expect(find.byType(RoundedScroll), findsOneWidget);
  });
}
