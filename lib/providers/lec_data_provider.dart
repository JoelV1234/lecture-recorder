import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lecrecorder/api/firebase_api.dart';
import 'package:lecrecorder/api/recorder_provider.dart';
import 'package:lecrecorder/providers/slide_data.dart';
import 'package:path_provider/path_provider.dart';

class LecDataProvider extends ChangeNotifier {
  File? slideFile;
  DateTime? startTime;
  File? recordingFile;
  List<SildeData> timeStamps = [];
  int currentSlide = 1;

  Future<void> reset(File selectedFile) async {
    currentSlide = 1;
    slideFile = selectedFile;
    startTime = DateTime.now();
    initRecorder();
    notifyListeners();
  }

  void nextSlide() {
    currentSlide++;
    addTimeStamp();
    notifyListeners();
  }

  void previousSlide() {
    if (currentSlide > 1) {
      currentSlide--;
      addTimeStamp();
      notifyListeners();
    }
  }

  Future<File> getTimeStampFile() async {
    final directory = await getApplicationDocumentsDirectory();
    String filePath = '${directory.path}/timestamps.txt';
    File currFile = File(filePath);
    await currFile.exists() ? await File(filePath).delete() : null;
    currFile = File(filePath);
    await currFile.writeAsString(timeStamps.toString());
    return currFile;
  }

  Future<void> initRecorder() async {
    recordingFile = await RecorderProvider.initalizeRecorder();
  }

  Future<void> exit() async {
    recordingFile?.delete();
    await RecorderProvider.stopRecording();
  }

  Future<void> finishaAndUpload() async {
    await exit();
    File timeStampFile = await getTimeStampFile();
    FireBaseApi.add(recordingFile!, slideFile!, timeStampFile);
  }

  void addTimeStamp() {
    if (startTime != null) {
      int timeStamp = DateTime.now().difference(startTime!).inSeconds;
      SildeData slideData =
          SildeData(slide: currentSlide, timeStamp: timeStamp);
      timeStamps.add(slideData);
      notifyListeners();
    }
  }
}
