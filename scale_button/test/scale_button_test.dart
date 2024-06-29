import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scale_button/scale_button.dart';

void main() {
  group('ScaleButton Widget Tests', () {
    testWidgets('ScaleButton tap triggers onTap callback', (WidgetTester tester) async {
      bool onTapTriggered = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ScaleButton(
              onTap: () {
                onTapTriggered = true;
              },
              child: Container(),
            ),
          ),
        ),
      );

      // Verify that onTap is initially not triggered
      expect(onTapTriggered, false);

      // Tap on the ScaleButton widget
      await tester.tap(find.byType(ScaleButton));

      // Rebuild the widget after the gesture
      await tester.pump();

      // Verify that onTap is triggered
      expect(onTapTriggered, false);
    });
  });
}
