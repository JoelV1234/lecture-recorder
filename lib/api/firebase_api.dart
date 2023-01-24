import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FireBaseApi {
  static FirebaseStorage storage = FirebaseStorage.instance;
  static final storageRef = storage.ref();
  static void add(File recording, File slides, File timeStamps) async {
    List<String> allRecordings = await getAllRecs();
    int recordingNumber = allRecordings.length + 1;
    storageRef.child('$recordingNumber/recording.mp4').putFile(recording);
    storageRef.child('$recordingNumber/slides').putFile(slides);
    storageRef.child('$recordingNumber/timestamps').putFile(timeStamps);
  }

  static Future<List<String>> getAllRecs() async {
    ListResult result = await storageRef.listAll();
    List<String> recordings = [];
    for (Reference recording in result.prefixes) {
      recordings.add(recording.name);
    }
    result.items.map((file) => recordings.add(file.name));
    return recordings;
  }
}
