import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tugas11/screen/flutterapp.dart';

void main() {
  testWidgets('Eksplorasi', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: EksplorasiHomePage(),
      ),
    );

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    await widgetTester.tap(find.byIcon(Icons.add));
    await widgetTester.pump();
  });
}
