import 'dart:async';
import 'package:flutter/material.dart';
import 'package:noise_meter/noise_meter.dart';
import 'package:permission_handler/permission_handler.dart';

class JorgenPage extends StatefulWidget {
  const JorgenPage({super.key});

  @override
  State<JorgenPage> createState() => _JorgenPageState();
}

class _JorgenPageState extends State<JorgenPage> {
  late NoiseMeter _noiseMeter;
  StreamSubscription<NoiseReading>? _noiseSubscription;
  double _currentDecibel = 0.0;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _noiseMeter = NoiseMeter();
    _requestPermissionAndStart();
  }

  Future<void> _requestPermissionAndStart() async {
    var status = await Permission.microphone.request();
    if (status.isGranted) {
      _startListening();
    } else {
      debugPrint("Microphone permission denied");
    }
  }

  void _startListening() {
    try {
      _noiseSubscription = _noiseMeter.noise.listen((noiseReading) {
        setState(() {
          _currentDecibel = noiseReading.meanDecibel;
        });
      });
      setState(() => _isRecording = true);
    } catch (err) {
      debugPrint("Failed to start listening: $err");
    }
  }

  void _stopListening() {
    _noiseSubscription?.cancel();
    _noiseSubscription = null;
    setState(() => _isRecording = false);
  }

  @override
  void dispose() {
    _stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Replace infinity with 0 for display
    final double db = _currentDecibel.isInfinite ? 0.0 : _currentDecibel;

    // Normalize dB to a range (0 dB = silence, 120 dB = jet engine)
    final double normalizedDb = (db.clamp(0, 120)) / 120;

    // Pick bar color based on loudness
    Color getBarColor(double value) {
      if (value < 0.4) return Colors.green;
      if (value < 0.7) return Colors.yellow;
      return Colors.red;
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Jörgeni leht")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Noise Level", style: TextStyle(fontSize: 20)),

            const SizedBox(height: 20),

            Container(
              width: 300,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  FractionallySizedBox(
                    widthFactor: normalizedDb,
                    child: Container(
                      decoration: BoxDecoration(
                        color: getBarColor(normalizedDb),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "${db.toStringAsFixed(2)} dB",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: _isRecording ? _stopListening : _startListening,
              child: Text(_isRecording ? "Stop Listening" : "Start Listening"),
            ),
          ],
        ),
      ),
    );
  }
}