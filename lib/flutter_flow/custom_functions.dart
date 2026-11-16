import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

LocationStruct? getLocationStrings(LatLng? location) {
  // return locationfrom latlng
  if (location == null) {
    return null;
  }

  final String latitude = location.latitude.toString();
  final String longitude = location.longitude.toString();

  final LocationStruct locationStruct = LocationStruct(
    latitude: latitude,
    longitude: longitude,
  );

  return locationStruct;
}

String createRandomStringHash(
  int numOfChars,
  bool? onlyNumbers,
  bool? onlyLetters,
  String? specialChars,
) {
  // null safety - default values
  int number = numOfChars;
  onlyNumbers = onlyNumbers ?? false;
  onlyLetters = onlyLetters ?? false;
  specialChars = specialChars ?? '';

  var chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  if (onlyNumbers) {
    chars = '1234567890';
  } else if (onlyLetters) {
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
  }

  if (specialChars.isNotEmpty) {
    chars = chars + specialChars;
  }

  var rnd = math.Random();

  return String.fromCharCodes(Iterable.generate(
      number, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
}

double getDistance(
  LatLng locationA,
  LatLng locationB,
) {
  // calculate the distance between two location and return in km but use dart math only
  final double lat1 = locationA.latitude;
  final double lon1 = locationA.longitude;
  final double lat2 = locationB.latitude;
  final double lon2 = locationB.longitude;

  final double p = 0.017453292519943295;
  final double a = 0.5 -
      math.cos((lat2 - lat1) * p) / 2 +
      math.cos(lat1 * p) *
          math.cos(lat2 * p) *
          (1 - math.cos((lon2 - lon1) * p)) /
          2;

  return 12742 * math.asin(math.sqrt(a));
}
