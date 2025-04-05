import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/kristjanpage.dart';
import 'package:myapp/pages/homepage.dart';
import 'package:myapp/pages/jorgenpage.dart';
import 'package:myapp/pages/hannespage.dart';
import 'package:myapp/pages/eerikpage.dart';

late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initsialiseerib saadaval olevad kaamerad
  _cameras = await availableCameras();

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
        ),
      ),
      home: const HomePage(),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/kristjanpage': (context) => KristjanPage(cameras: _cameras), // passib saadaval olevad kaamerad teisele lehele
        '/jorgenpage': (context) => const JorgenPage(),
        '/hannespage': (context) => const HannesPage(),
        '/eerikpage': (context) => const EerikPage(),
      },
    );
  }
}
