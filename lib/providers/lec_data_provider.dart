import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lecrecorder/providers/slide_data.dart';

class LecDataProvider extends ChangeNotifier {
  File? slideFile;
  File? recordingFile;
  DateTime? startTime;
  List<SildeData> timeStamps = [];
  int currentSlide = 1;

  void reset(File selectedFile) {
    currentSlide = 1;
    slideFile = selectedFile;
    startTime = DateTime.now();
    notifyListeners();
  }

  void nextSlide() {
    currentSlide++;
    notifyListeners();
  }

  void previousSlide() {
    if(currentSlide > 1) {
      currentSlide--;
      notifyListeners();
    }
  }

  void addTimeStamp(int slide) {
    if (startTime != null) {
      int timeStamp = startTime!.difference(DateTime.now()).inSeconds;
      SildeData slideData = SildeData(slide: slide, timeStamp: timeStamp);
      timeStamps.add(slideData);
      notifyListeners();
    }
  }
}
