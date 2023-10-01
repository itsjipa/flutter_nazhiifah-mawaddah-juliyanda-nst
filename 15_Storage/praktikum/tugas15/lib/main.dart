import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas15/model/db_manager.dart';
import 'package:tugas15/screens/contact_login.dart';
import 'package:tugas15/screens/contact_screen.dart';
import 'package:tugas15/utils/contact_sharedpreferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userIsLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkUserLogIn();
  }

  _checkUserLogIn() async {
    bool? isLogIn = await LoginSharedPreferences.getUserLogInPrefernces();
    setState(() {
      userIsLoggedIn = isLogIn!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DbManager(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: userIsLoggedIn ? const ContactScreen() : const LoginScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              color: Colors.deepPurpleAccent,
              centerTitle: true,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 2.0,
              ),
              iconTheme: IconThemeData(color: Colors.white)),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Color.fromARGB(255, 214, 219, 221),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurpleAccent,
              foregroundColor: Colors.white,
              elevation: 2.0,
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          useMaterial3: true,
        ),
      ),
    );
  }
}
