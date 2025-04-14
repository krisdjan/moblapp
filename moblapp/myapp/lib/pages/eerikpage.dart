import 'package:flutter/material.dart';
import 'dart:async';

class EerikPage extends StatefulWidget {
  const EerikPage({super.key});

  @override
  _EerikPageState createState() => _EerikPageState();
}

class _EerikPageState extends State<EerikPage> {
  late String _time;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _time = ""; 
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {});
    });
  }

  String _getFormattedTime() {
    final now = TimeOfDay.now();
    return now.format(context);
  }

  @override
//Sulgeb timeri lehelt lahkudes
  void dispose() {
    _timer.cancel();
    super.dispose();
}
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reaalajas Kell')),
      body: Center(
        child: Text(
          _getFormattedTime(),
          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
