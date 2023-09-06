import 'package:flutter/cupertino.dart';

class CupertinoHomePage extends StatelessWidget {
  const CupertinoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("MaterialApp"),
      ),
     
      child: Center(
        child: Text(
          "This is a Cupertino App",
        ),
      ),
    );
  }
}
