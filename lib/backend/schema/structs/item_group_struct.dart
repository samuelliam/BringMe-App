// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemGroupStruct extends FFFirebaseStruct {
  ItemGroupStruct({
    int? groupID,
    String? groupName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _groupID = groupID,
        _groupName = groupName,
        super(firestoreUtilData);

  // "groupID" field.
  int? _groupID;
  int get groupID => _groupID ?? 0;
  set groupID(int? val) => _groupID = val;

  void incrementGroupID(int amount) => groupID = groupID + amount;

  bool hasGroupID() => _groupID != null;

  // "groupName" field.
  String? _groupName;
  String get groupName => _groupName ?? '';
  set groupName(String? val) => _groupName = val;

  bool hasGroupName() => _groupName != null;

  static ItemGroupStruct fromMap(Map<String, dynamic> data) => ItemGroupStruct(
        groupID: castToType<int>(data['groupID']),
        groupName: data['groupName'] as String?,
      );

  static ItemGroupStruct? maybeFromMap(dynamic data) => data is Map
      ? ItemGroupStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'groupID': _groupID,
        'groupName': _groupName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'groupID': serializeParam(
          _groupID,
          ParamType.int,
        ),
        'groupName': serializeParam(
          _groupName,
          ParamType.String,
        ),
      }.withoutNulls;

  static ItemGroupStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemGroupStruct(
        groupID: deserializeParam(
          data['groupID'],
          ParamType.int,
          false,
        ),
        groupName: deserializeParam(
          data['groupName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ItemGroupStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemGroupStruct &&
        groupID == other.groupID &&
        groupName == other.groupName;
  }

  @override
  int get hashCode => const ListEquality().hash([groupID, groupName]);
}

ItemGroupStruct createItemGroupStruct({
  int? groupID,
  String? groupName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ItemGroupStruct(
      groupID: groupID,
      groupName: groupName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ItemGroupStruct? updateItemGroupStruct(
  ItemGroupStruct? itemGroup, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    itemGroup
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addItemGroupStructData(
  Map<String, dynamic> firestoreData,
  ItemGroupStruct? itemGroup,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (itemGroup == null) {
    return;
  }
  if (itemGroup.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && itemGroup.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final itemGroupData = getItemGroupFirestoreData(itemGroup, forFieldValue);
  final nestedData = itemGroupData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = itemGroup.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getItemGroupFirestoreData(
  ItemGroupStruct? itemGroup, [
  bool forFieldValue = false,
]) {
  if (itemGroup == null) {
    return {};
  }
  final firestoreData = mapToFirestore(itemGroup.toMap());

  // Add any Firestore field values
  itemGroup.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getItemGroupListFirestoreData(
  List<ItemGroupStruct>? itemGroups,
) =>
    itemGroups?.map((e) => getItemGroupFirestoreData(e, true)).toList() ?? [];
