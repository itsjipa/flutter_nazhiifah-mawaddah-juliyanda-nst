import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tugas11/screen/prioritas2.dart';

void main() {
  testWidgets('Prioritas2', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: Prioritas2(),
      ),
    );

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Haloo'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    await widgetTester.tap(find.text('Click Me'), warnIfMissed: false);
    await widgetTester.pumpAndSettle();
  });
}
