// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FirebaseCheckListItemStruct extends FFFirebaseStruct {
  FirebaseCheckListItemStruct({
    String? itemName,
    DateTime? lastUpdatedDate,
    List<LatLongDoubleStruct>? locationHistory,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _itemName = itemName,
        _lastUpdatedDate = lastUpdatedDate,
        _locationHistory = locationHistory,
        super(firestoreUtilData);

  // "itemName" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  set itemName(String? val) => _itemName = val;

  bool hasItemName() => _itemName != null;

  // "lastUpdatedDate" field.
  DateTime? _lastUpdatedDate;
  DateTime? get lastUpdatedDate => _lastUpdatedDate;
  set lastUpdatedDate(DateTime? val) => _lastUpdatedDate = val;

  bool hasLastUpdatedDate() => _lastUpdatedDate != null;

  // "locationHistory" field.
  List<LatLongDoubleStruct>? _locationHistory;
  List<LatLongDoubleStruct> get locationHistory => _locationHistory ?? const [];
  set locationHistory(List<LatLongDoubleStruct>? val) => _locationHistory = val;

  void updateLocationHistory(Function(List<LatLongDoubleStruct>) updateFn) {
    updateFn(_locationHistory ??= []);
  }

  bool hasLocationHistory() => _locationHistory != null;

  static FirebaseCheckListItemStruct fromMap(Map<String, dynamic> data) =>
      FirebaseCheckListItemStruct(
        itemName: data['itemName'] as String?,
        lastUpdatedDate: data['lastUpdatedDate'] as DateTime?,
        locationHistory: getStructList(
          data['locationHistory'],
          LatLongDoubleStruct.fromMap,
        ),
      );

  static FirebaseCheckListItemStruct? maybeFromMap(dynamic data) => data is Map
      ? FirebaseCheckListItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'itemName': _itemName,
        'lastUpdatedDate': _lastUpdatedDate,
        'locationHistory': _locationHistory?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'itemName': serializeParam(
          _itemName,
          ParamType.String,
        ),
        'lastUpdatedDate': serializeParam(
          _lastUpdatedDate,
          ParamType.DateTime,
        ),
        'locationHistory': serializeParam(
          _locationHistory,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static FirebaseCheckListItemStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FirebaseCheckListItemStruct(
        itemName: deserializeParam(
          data['itemName'],
          ParamType.String,
          false,
        ),
        lastUpdatedDate: deserializeParam(
          data['lastUpdatedDate'],
          ParamType.DateTime,
          false,
        ),
        locationHistory: deserializeStructParam<LatLongDoubleStruct>(
          data['locationHistory'],
          ParamType.DataStruct,
          true,
          structBuilder: LatLongDoubleStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'FirebaseCheckListItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FirebaseCheckListItemStruct &&
        itemName == other.itemName &&
        lastUpdatedDate == other.lastUpdatedDate &&
        listEquality.equals(locationHistory, other.locationHistory);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([itemName, lastUpdatedDate, locationHistory]);
}

FirebaseCheckListItemStruct createFirebaseCheckListItemStruct({
  String? itemName,
  DateTime? lastUpdatedDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FirebaseCheckListItemStruct(
      itemName: itemName,
      lastUpdatedDate: lastUpdatedDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FirebaseCheckListItemStruct? updateFirebaseCheckListItemStruct(
  FirebaseCheckListItemStruct? firebaseCheckListItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    firebaseCheckListItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFirebaseCheckListItemStructData(
  Map<String, dynamic> firestoreData,
  FirebaseCheckListItemStruct? firebaseCheckListItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (firebaseCheckListItem == null) {
    return;
  }
  if (firebaseCheckListItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      firebaseCheckListItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final firebaseCheckListItemData = getFirebaseCheckListItemFirestoreData(
      firebaseCheckListItem, forFieldValue);
  final nestedData =
      firebaseCheckListItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      firebaseCheckListItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFirebaseCheckListItemFirestoreData(
  FirebaseCheckListItemStruct? firebaseCheckListItem, [
  bool forFieldValue = false,
]) {
  if (firebaseCheckListItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(firebaseCheckListItem.toMap());

  // Add any Firestore field values
  firebaseCheckListItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFirebaseCheckListItemListFirestoreData(
  List<FirebaseCheckListItemStruct>? firebaseCheckListItems,
) =>
    firebaseCheckListItems
        ?.map((e) => getFirebaseCheckListItemFirestoreData(e, true))
        .toList() ??
    [];
