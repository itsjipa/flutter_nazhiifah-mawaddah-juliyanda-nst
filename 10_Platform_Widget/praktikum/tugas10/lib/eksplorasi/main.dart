import 'package:flutter/material.dart';
import 'package:tugas10/eksplorasi/flutterapp.dart';

class Eksplorasi extends StatelessWidget {
  const Eksplorasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(
            0xff6200EE,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(
            0xff6200EE,
          ),
        )
      ),
      home: EksplorasiHomePage(),
    );
  }
}
