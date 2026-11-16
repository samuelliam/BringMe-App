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

Future moveItemDown(CheckListItemStruct currentItem) async {
  // Add your function code here!
  int indexOfCurrentItem = FFAppState().checklistItems.indexOf(currentItem);

  if (indexOfCurrentItem < FFAppState().checklistItems.length - 1) {
    FFAppState().checklistItems.removeAt(indexOfCurrentItem);
    FFAppState().checklistItems.insert(indexOfCurrentItem + 1, currentItem);
  }
}
