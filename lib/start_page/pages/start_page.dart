// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lecrecorder/api/pdf_api.dart';
import 'package:lecrecorder/utils/getters.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  void pdfFile() async {
    File? file = await PDFApi.pickFile();
    if (file != null) {
      getLecDataProvider(context).reset(file);
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
