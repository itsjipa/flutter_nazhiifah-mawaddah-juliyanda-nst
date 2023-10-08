import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas16/viewmodel/provider/image_provider.dart';
import 'package:tugas16/view/screen/api_screen.dart';
import 'package:tugas16/model/service/api_service.dart';
import 'package:tugas16/view/screen/image_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => APIService(),
        ),
        ChangeNotifierProvider(create: (context) => ImageProvider1())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.white,
            color: Colors.purple,
            centerTitle: true,
            titleSpacing: 2.5,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              elevation: 2.0,
              alignment: Alignment.center,
              textStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const APIScreen(),
          '/image': (context) => const ImageScreen(),
        },
      ),
    );
  }
}
