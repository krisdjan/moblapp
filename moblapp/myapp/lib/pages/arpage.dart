import 'package:flutter/material.dart';

class ARPage extends StatefulWidget {
  const ARPage({super.key});
  @override
  ARPageState createState() => ARPageState();
}

class ARPageState extends State<ARPage> {
  List<Color> cubeColors = [Colors.green, Colors.red, Colors.blue];
  int currentColorIndex = 0;

  void _cycleColor() {
    setState(() {
      currentColorIndex = (currentColorIndex + 1) % cubeColors.length;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Cube color changed to ${cubeColors[currentColorIndex].toString().split('.')[1]}!'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Augmented Reality'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'AR Feature Simulation',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Interact with colored cubes\n(AR coming soon!)',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: cubeColors[currentColorIndex],
                border: Border.all(color: Colors.black, width: 2),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _cycleColor,
              child: const Text('Change Cube Color'),
            ),
          ],
        ),
      ),
    );
  }
}