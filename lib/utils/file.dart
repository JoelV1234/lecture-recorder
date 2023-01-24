import 'dart:io';
import 'package:file_picker/file_picker.dart';

Future<File?> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'mp4', 'm4a'],
    );
    return result == null ? null : File(result.paths.first!);
  }