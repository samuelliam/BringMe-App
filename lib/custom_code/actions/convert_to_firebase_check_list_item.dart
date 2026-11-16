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

Future<List<FirebaseCheckListItemStruct>?> convertToFirebaseCheckListItem(
    List<CheckListItemStruct>? checklistItems) async {
  // Add your function code here!
  List<FirebaseCheckListItemStruct> convertedCheckListItems = [];
  FFAppState().checklistItems.forEach((element) {
    var firebaseListItem = FirebaseCheckListItemStruct(
        itemName: element.itemName, lastUpdatedDate: element.lastTimeUpdated);
    element.locationHistoryWithAddress.forEach((location) {
      firebaseListItem.locationHistory.add(LatLongDoubleStruct(
          latitude: location.latLong?.latitude,
          longitude: location.latLong?.longitude));
    });

    convertedCheckListItems.add(firebaseListItem);
  });

  return convertedCheckListItems;
}
