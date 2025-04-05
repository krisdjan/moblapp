import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class KristjanPage extends StatefulWidget {

  final List<CameraDescription> cameras;
  const KristjanPage({super.key, required this.cameras});

  @override
  State<KristjanPage> createState() => _CameraAppState();
}

class _CameraAppState extends State<KristjanPage> {

  late CameraController controller;
  int _cameraIndex = 0; //saadaval olevate kaamerate index

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  // kaamera initsialeerimine
  void _initializeCamera() {
    controller = CameraController(
      widget.cameras[_cameraIndex], 
      ResolutionPreset.max,
    );

    //vigade handle kaamera controlleri käivitamisel
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            //ligipääsu vigade handle
            break;
          default:
            //teiste vigade handle
            break;
        }
      }
    });
  }
// Switch camera action
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _switchCamera() {
    setState(() {
      // indexi vahetus läbi saadaval olevate kaamerate
      _cameraIndex = (_cameraIndex + 1) % widget.cameras.length;
      _initializeCamera();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Feed'),
        actions: [
          IconButton(
            icon: const Icon(Icons.switch_camera),
            onPressed: _switchCamera,
          ),
        ],
      ),
      body: CameraPreview(controller),
    );
  }
}
