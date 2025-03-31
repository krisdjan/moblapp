import 'package:flutter/material.dart';
import 'pages/counter.dart'; 
import 'pages/homepage.dart'; 
import 'pages/timepage.dart'; 

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const HomePage(), 
      routes: {
        '/homepage': (context) => const HomePage(), 
        '/counterpage': (context) => const CounterPage(), 
        '/timepage': (context) => const TimePage(), 
      },
    );
  }
}
