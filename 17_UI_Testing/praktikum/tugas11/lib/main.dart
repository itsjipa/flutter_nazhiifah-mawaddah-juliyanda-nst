import 'package:flutter/material.dart';
import 'package:tugas11/screen/form_advance.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.deepPurpleAccent),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color.fromARGB(255, 214, 219, 221),
        ),
        useMaterial3: true,
      ),
      home: const FormAdvance(),
    );
  }
}

