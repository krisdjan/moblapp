import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _nameController = TextEditingController();
  bool _darkMode = false;

  @override
  void initState() {
    super.initState();
    _loadSettingsFromFile();
  }

  Future<File> _getConfigFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/config.txt');
  }

  Future<void> _loadSettingsFromFile() async {
    final permission = await Permission.storage.request();
    if (!permission.isGranted) return;

    final file = await _getConfigFile();

    if (await file.exists()) {
      final lines = await file.readAsLines();
      for (var line in lines) {
        if (line.startsWith('user_name=')) {
          _nameController.text = line.split('=')[1];
        } else if (line.startsWith('dark_mode=')) {
          _darkMode = line.split('=')[1].toLowerCase() == 'true';
        }
      }
    }

    setState(() {}); // uuenda UI pärast laadimist
  }

  Future<void> _saveSettingsToFile() async {
    final file = await _getConfigFile();
    final content = '''
user_name=${_nameController.text}
dark_mode=$_darkMode
''';
    await file.writeAsString(content.trim());
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Salvestatud config.txt failina")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Seaded")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Sinu nimi"),
            ),
            SwitchListTile(
              title: const Text("Tume režiim"),
              value: _darkMode,
              onChanged: (val) => setState(() => _darkMode = val),
            ),
            ElevatedButton(
              onPressed: _saveSettingsToFile,
              child: const Text("Salvesta config.txt"),
            ),
          ],
        ),
      ),
    );
  }
}
