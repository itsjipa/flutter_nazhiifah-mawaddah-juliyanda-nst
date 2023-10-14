import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tugas11/screen/form_advance.dart';

void main() {
  testWidgets('Form Advance Testing', (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: FormAdvance(),
    ));

    final nameField = find.byType(TextFormField).at(0);
    final numberField = find.byType(TextFormField).at(1);
    final dateField = find.byType(TextFormField).at(2);
    final colorButton = find.byType(ElevatedButton).at(0);
    final fileButton = find.byType(ElevatedButton).at(1);
    final submitButton = find.byType(ElevatedButton).at(2);

    expect(find.text('Contacts'), findsOneWidget);
    expect(nameField, findsOneWidget);
    expect(numberField, findsOneWidget);
    expect(dateField, findsOneWidget);
    expect(colorButton, findsOneWidget);
    expect(fileButton, findsOneWidget);
    expect(submitButton, findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
  });
}
