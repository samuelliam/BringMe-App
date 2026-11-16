// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String?> getImagePath(FFUploadedFile uploadedFile) async {
  // get imagepath from uploadedfile
  String? imagePath;
  if (uploadedFile != null) {
    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final String appPath = appDirectory.path;
    final String fileName = uploadedFile.name ?? "";
    final String filePath = '$appPath/$fileName';
    final File file = File(filePath);
    final listBytes = uploadedFile.bytes;
    await file.writeAsBytes(listBytes!);
    imagePath = filePath;
  }
  return imagePath;
}
