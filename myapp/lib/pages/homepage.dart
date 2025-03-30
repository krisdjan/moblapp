import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page"),),
      body: Center(
        child: ElevatedButton(
          child: const Text("Counter"),
          onPressed: () => {
            //go to counter page
            Navigator.pushNamed(context, '/counterpage')
          }),
      )
    );
  }
}