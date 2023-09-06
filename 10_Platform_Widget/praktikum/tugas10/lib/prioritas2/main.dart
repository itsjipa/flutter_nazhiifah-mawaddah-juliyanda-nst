import 'package:flutter/cupertino.dart';
import 'package:tugas10/prioritas2/cupertinoHomePage.dart';

class Prioritas2 extends StatelessWidget {
  final _themeDart = CupertinoThemeData.raw(
      Brightness.dark, null, null, null, null, null, null);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: _themeDart,
      debugShowCheckedModeBanner: false,
      home: CupertinoHomePage(),
    );
  }
}
