import 'package:flutter/material.dart';
import 'package:tugas10/prioritas1/homepage.dart';

class Prioritas1 extends StatelessWidget {
  const Prioritas1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}