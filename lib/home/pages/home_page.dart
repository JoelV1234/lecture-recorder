// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder3/flutter_audio_recorder3.dart';
import 'package:lecrecorder/api/firebase_api.dart';
import 'package:lecrecorder/utils/file.dart';
import 'package:lecrecorder/utils/getters.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void pdfFile() async {
    File? file = await pickFile();
    bool? hasPermission = await FlutterAudioRecorder3.hasPermissions;
    if (file != null && hasPermission == true) {
      await getLecDataProvider(context).reset(file);
      Navigator.pushNamed(context, '/recorder');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lec recorder')),
      body: Center(
        child: ElevatedButton(
            onPressed: () => pdfFile(),
            child: const Text('Select lecture slide file')),
      ),
    );
  }
}
