import 'package:flutter/material.dart';
import 'package:myapp/pages/kristjanpage.dart';
import 'package:myapp/pages/homepage.dart';
import 'package:myapp/pages/jorgenpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        )
        ),
      home: const HomePage(),
      routes: {
        '/homepage':(context) => HomePage(),
        '/kristjanpage':(context) => KristjanPage(),
        '/jorgenpage':(context) => JorgenPage()
      },
  );
  }
}