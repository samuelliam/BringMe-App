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

import 'package:home_widget/home_widget.dart';

Future updateHomeWidgetData() async {
  // get all itemName in newItemList and convert to string with comma separator
  var currentItemList = FFAppState().checklistItems;
  String itemNames = currentItemList.map((item) => item.itemName).join(",");
  if (itemNames.isNotEmpty) {
    await HomeWidget.saveWidgetData('itemNames', itemNames);
    await HomeWidget.updateWidget(
        iOSName: 'BringMeWidget', androidName: 'BringMeWidget');
    print('widget updated');
  } else {
    print('widget update failed');
  }
}
