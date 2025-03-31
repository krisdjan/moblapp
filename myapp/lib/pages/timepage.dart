import 'package:flutter/material.dart';
import 'dart:async';

class TimePage extends StatefulWidget {
  const TimePage({super.key});

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
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
