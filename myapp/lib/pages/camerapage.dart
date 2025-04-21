import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class CameraSavePage extends StatefulWidget {
  const CameraSavePage({super.key});

  @override
  State<CameraSavePage> createState() => _CameraSavePageState();
}

class _CameraSavePageState extends State<CameraSavePage> {
  File? _savedImage;

  @override
  void initState() {
    super.initState();
    _loadSavedImage();
  }

  Future<void> _loadSavedImage() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/saved_image.jpg');
    if (await file.exists()) {
      setState(() {
        _savedImage = file;
      });
    }
  }

  Future<void> _pickAndSaveImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final dir = await getApplicationDocumentsDirectory();
      final savedImage = await File(pickedFile.path).copy('${dir.path}/saved_image.jpg');

      setState(() {
        _savedImage = savedImage;
      });

      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        const SnackBar(content: Text("Pilt salvestatud rakenduse mällu")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kaamera ja salvestus")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _savedImage != null
                ? Image.file(_savedImage!, width: 300)
                : const Text("Ühtegi pilti pole veel salvestatud"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickAndSaveImage,
              child: const Text("Tee pilt ja salvesta"),
            ),
          ],
        ),
      ),
    );
  }
}
