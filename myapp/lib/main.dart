import 'package:flutter/material.dart';
import 'package:myapp/pages/counter.dart';
import 'package:myapp/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const HomePage(),
      routes: {
        '/homepage':(context) => HomePage(),
        '/counterpage':(context) => CounterPage()
      },
  );
  }
}