// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LatLongWithAddressStruct extends FFFirebaseStruct {
  LatLongWithAddressStruct({
    LatLng? latLong,
    String? address,
    DateTime? dateTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _latLong = latLong,
        _address = address,
        _dateTime = dateTime,
        super(firestoreUtilData);

  // "LatLong" field.
  LatLng? _latLong;
  LatLng? get latLong => _latLong;
  set latLong(LatLng? val) => _latLong = val;

  bool hasLatLong() => _latLong != null;

  // "Address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "dateTime" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  set dateTime(DateTime? val) => _dateTime = val;

  bool hasDateTime() => _dateTime != null;

  static LatLongWithAddressStruct fromMap(Map<String, dynamic> data) =>
      LatLongWithAddressStruct(
        latLong: data['LatLong'] as LatLng?,
        address: data['Address'] as String?,
        dateTime: data['dateTime'] as DateTime?,
      );

  static LatLongWithAddressStruct? maybeFromMap(dynamic data) => data is Map
      ? LatLongWithAddressStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'LatLong': _latLong,
        'Address': _address,
        'dateTime': _dateTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'LatLong': serializeParam(
          _latLong,
          ParamType.LatLng,
        ),
        'Address': serializeParam(
          _address,
          ParamType.String,
        ),
        'dateTime': serializeParam(
          _dateTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static LatLongWithAddressStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LatLongWithAddressStruct(
        latLong: deserializeParam(
          data['LatLong'],
          ParamType.LatLng,
          false,
        ),
        address: deserializeParam(
          data['Address'],
          ParamType.String,
          false,
        ),
        dateTime: deserializeParam(
          data['dateTime'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'LatLongWithAddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LatLongWithAddressStruct &&
        latLong == other.latLong &&
        address == other.address &&
        dateTime == other.dateTime;
  }

  @override
  int get hashCode => const ListEquality().hash([latLong, address, dateTime]);
}

LatLongWithAddressStruct createLatLongWithAddressStruct({
  LatLng? latLong,
  String? address,
  DateTime? dateTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LatLongWithAddressStruct(
      latLong: latLong,
      address: address,
      dateTime: dateTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LatLongWithAddressStruct? updateLatLongWithAddressStruct(
  LatLongWithAddressStruct? latLongWithAddress, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    latLongWithAddress
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLatLongWithAddressStructData(
  Map<String, dynamic> firestoreData,
  LatLongWithAddressStruct? latLongWithAddress,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (latLongWithAddress == null) {
    return;
  }
  if (latLongWithAddress.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && latLongWithAddress.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final latLongWithAddressData =
      getLatLongWithAddressFirestoreData(latLongWithAddress, forFieldValue);
  final nestedData =
      latLongWithAddressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      latLongWithAddress.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLatLongWithAddressFirestoreData(
  LatLongWithAddressStruct? latLongWithAddress, [
  bool forFieldValue = false,
]) {
  if (latLongWithAddress == null) {
    return {};
  }
  final firestoreData = mapToFirestore(latLongWithAddress.toMap());

  // Add any Firestore field values
  latLongWithAddress.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLatLongWithAddressListFirestoreData(
  List<LatLongWithAddressStruct>? latLongWithAddresss,
) =>
    latLongWithAddresss
        ?.map((e) => getLatLongWithAddressFirestoreData(e, true))
        .toList() ??
    [];
