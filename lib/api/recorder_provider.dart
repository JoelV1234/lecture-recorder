import 'dart:io';
import 'package:flutter_audio_recorder3/flutter_audio_recorder3.dart';
import 'package:path_provider/path_provider.dart';

class RecorderProvider {
  static FlutterAudioRecorder3? recorder;

  static Future<File> initalizeRecorder() async {
    final directory = await getApplicationDocumentsDirectory();
    String filePath = '${directory.path}/recorder.mp4';
    File currFile = File(filePath);
    await currFile.exists() ? await File(filePath).delete() : null;
    recorder = FlutterAudioRecorder3('${directory.path}/recorder.mp4');
    File recordingFile = File('${directory.path}/recorder.mp4');
    await recorder!.initialized;
    await recorder!.current(channel: 0);
    await recorder!.start();
    return recordingFile;
  }

  static Future<void> stopRecording() async {
    await recorder!.stop();
  }
}
