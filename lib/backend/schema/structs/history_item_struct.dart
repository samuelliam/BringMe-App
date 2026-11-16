// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HistoryItemStruct extends FFFirebaseStruct {
  HistoryItemStruct({
    DateTime? datetime,
    LatLng? location,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _datetime = datetime,
        _location = location,
        super(firestoreUtilData);

  // "datetime" field.
  DateTime? _datetime;
  DateTime? get datetime => _datetime;
  set datetime(DateTime? val) => _datetime = val;

  bool hasDatetime() => _datetime != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? val) => _location = val;

  bool hasLocation() => _location != null;

  static HistoryItemStruct fromMap(Map<String, dynamic> data) =>
      HistoryItemStruct(
        datetime: data['datetime'] as DateTime?,
        location: data['location'] as LatLng?,
      );

  static HistoryItemStruct? maybeFromMap(dynamic data) => data is Map
      ? HistoryItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'datetime': _datetime,
        'location': _location,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'datetime': serializeParam(
          _datetime,
          ParamType.DateTime,
        ),
        'location': serializeParam(
          _location,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static HistoryItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      HistoryItemStruct(
        datetime: deserializeParam(
          data['datetime'],
          ParamType.DateTime,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.LatLng,
          false,
        ),
      );

  @override
  String toString() => 'HistoryItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HistoryItemStruct &&
        datetime == other.datetime &&
        location == other.location;
  }

  @override
  int get hashCode => const ListEquality().hash([datetime, location]);
}

HistoryItemStruct createHistoryItemStruct({
  DateTime? datetime,
  LatLng? location,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HistoryItemStruct(
      datetime: datetime,
      location: location,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HistoryItemStruct? updateHistoryItemStruct(
  HistoryItemStruct? historyItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    historyItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHistoryItemStructData(
  Map<String, dynamic> firestoreData,
  HistoryItemStruct? historyItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (historyItem == null) {
    return;
  }
  if (historyItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && historyItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final historyItemData =
      getHistoryItemFirestoreData(historyItem, forFieldValue);
  final nestedData =
      historyItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = historyItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHistoryItemFirestoreData(
  HistoryItemStruct? historyItem, [
  bool forFieldValue = false,
]) {
  if (historyItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(historyItem.toMap());

  // Add any Firestore field values
  historyItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHistoryItemListFirestoreData(
  List<HistoryItemStruct>? historyItems,
) =>
    historyItems?.map((e) => getHistoryItemFirestoreData(e, true)).toList() ??
    [];
