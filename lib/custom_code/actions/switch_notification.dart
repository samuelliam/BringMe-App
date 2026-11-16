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

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzData;

Future switchNotification(
  bool isOn,
  int? hour,
) async {
  FlutterLocalNotificationsPlugin().cancelAll();

  if (isOn) {
    final androidDetail = AndroidNotificationDetails(
        '1', // channel Id
        'itemNotif' // channel Name
        );

    final iosDetail = DarwinNotificationDetails();

    final noticeDetail = NotificationDetails(
      iOS: iosDetail,
      android: androidDetail,
    );

    final id = 1;

    await FlutterLocalNotificationsPlugin().cancelAll();

    await FlutterLocalNotificationsPlugin().zonedSchedule(
        id,
        'Hello There! 👋',
        'Lets check your items if they are still with you!',
        tz.TZDateTime.now(tz.local).add(Duration(hours: hour ?? 1)),
        noticeDetail,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);
  }
}
