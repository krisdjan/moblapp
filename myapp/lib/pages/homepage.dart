import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Keeps the column compact
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/kristjanpage');
              },
              child: const Text("Kristjan"),
            ),
            const SizedBox(height: 16), // Adds spacing between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/jorgenpage'); // go to jorgen page
              },
              child: const Text("Jörgen"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/hannespage');
              },
              child: const Text("Hannes"),
            ),
            const SizedBox(height: 16),
            ElevatedButton( // <- parandatud
              onPressed: () {
                Navigator.pushNamed(context, '/timepage');
              },
              child: const Text("Eerik")
            ),
          ],
        ),
      ),
    );
  }
}
