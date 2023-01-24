class SildeData {
  int timeStamp;
  int slide;
  SildeData({
    required this.timeStamp,
    required this.slide
  });

  @override
  String toString() {
    return '{$slide, $timeStamp}';
  }
}
