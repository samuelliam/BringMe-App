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

Future mergeUserItems(List<ItemsRecord>? fetchedUserItems) async {
  // Add your function code here!

  if (fetchedUserItems?.isEmpty ?? true) {
    return;
  }

  final localUserItems = FFAppState().checklistItems;
  var mergedUserItems = [];

  fetchedUserItems?.forEach((fetchedItem) {
    if (localUserItems
        .firstWhere((element) => element.itemName == fetchedItem.itemName,
            orElse: () => CheckListItemStruct())
        .itemName
        .isNotEmpty) {
      var itemHistory = fetchedItem.itemHistory;
      var newItem = CheckListItemStruct(
          itemName: fetchedItem.itemName,
          itemGroup: 0,
          locationHistory: itemHistory.map((item) => item.location!).toList(),
          lastLocation: itemHistory.last.location);
      FFAppState().checklistItems.add(newItem);
    }
  });
}
